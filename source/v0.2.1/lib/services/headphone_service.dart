import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// One observation of the actual device. No mocked battery levels are used.
class HeadphoneSnapshot {
  const HeadphoneSnapshot({
    required this.connected,
    required this.connectionConfirmed,
    required this.deviceName,
    required this.battery,
    required this.protocols,
    required this.firmware,
    required this.updatedAt,
    this.warning,
  });

  final bool connected;
  final bool connectionConfirmed;
  final String deviceName;
  final int? battery;
  final Set<String> protocols;
  final String? firmware;
  final DateTime updatedAt;
  final String? warning;
}

class BatteryReading {
  const BatteryReading(this.percent, {required this.charging});
  final int percent;
  final bool charging;
}

class BluetoothReading {
  const BluetoothReading({
    required this.connected,
    required this.name,
    required this.protocols,
    this.firmware,
  });

  final bool connected;
  final String name;
  final Set<String> protocols;
  final String? firmware;
}

class HeadphoneService {
  static const targetName = 'MAJOR III BLUETOOTH';

  Future<HeadphoneSnapshot> inspect() async {
    if (!Platform.isMacOS) {
      return HeadphoneSnapshot(
        connected: false,
        connectionConfirmed: false,
        deviceName: targetName,
        battery: null,
        protocols: const <String>{},
        firmware: null,
        updatedAt: DateTime.now(),
        warning: 'Il rilevamento reale è disponibile solo su macOS in questa versione.',
      );
    }

    BatteryReading? battery;
    BluetoothReading? bluetooth;
    bool bluetoothQuerySucceeded = false;
    String? warning;

    try {
      final result = await Process.run('/usr/bin/pmset', ['-g', 'accps'])
          .timeout(const Duration(seconds: 8));
      if (result.exitCode == 0) {
        battery = parseAccps(result.stdout.toString());
      } else {
        warning = 'Impossibile leggere la batteria da pmset.';
      }
    } catch (_) {
      warning = 'Impossibile eseguire pmset. Controlla i permessi dell’app.';
    }

    try {
      final result = await Process.run(
        '/usr/sbin/system_profiler',
        ['SPBluetoothDataType', '-json'],
      ).timeout(const Duration(seconds: 12));
      if (result.exitCode == 0) {
        bluetoothQuerySucceeded = true;
        bluetooth = parseBluetooth(result.stdout.toString());
      } else {
        warning ??= 'Impossibile interrogare il Bluetooth di macOS.';
      }
    } catch (_) {
      warning ??= 'Impossibile eseguire system_profiler.';
    }

    // The battery accessory record is useful evidence when system_profiler
    // cannot expose the device; an explicit connected flag takes precedence.
    final connected = bluetooth?.connected ?? (battery != null);
    return HeadphoneSnapshot(
      connected: connected,
      connectionConfirmed: bluetoothQuerySucceeded || battery != null,
      deviceName: bluetooth?.name ?? targetName,
      battery: connected ? battery?.percent : null,
      protocols: bluetooth?.protocols ?? const {},
      firmware: bluetooth?.firmware,
      updatedAt: DateTime.now(),
      warning: warning,
    );
  }

  /// Parses only the MAJOR III accessory line, not a Mac or mouse battery.
  static BatteryReading? parseAccps(String output) {
    final pattern = RegExp(
      r'^\s*-\s*MAJOR III BLUETOOTH\s+\(id=\d+\)\s+(\d{1,3})%;([^\r\n]*)',
      caseSensitive: false,
      multiLine: true,
    );
    final match = pattern.firstMatch(output);
    if (match == null) return null;
    final value = int.tryParse(match.group(1)!);
    if (value == null || value < 0 || value > 100) return null;
    final attributes = match.group(2)!.toLowerCase();
    return BatteryReading(
      value,
      charging: attributes.contains('charging') &&
          !attributes.contains('discharging') &&
          !attributes.contains('not charging'),
    );
  }

  /// Accepts the structure returned by `system_profiler SPBluetoothDataType -json`.
  static BluetoothReading? parseBluetooth(String output) {
    final dynamic json;
    try {
      json = jsonDecode(output);
    } catch (_) {
      return null;
    }
    if (json is! Map<String, dynamic>) return null;
    final controllers = json['SPBluetoothDataType'];
    if (controllers is! List) return null;

    for (final controller in controllers) {
      if (controller is! Map) continue;
      for (final section in ['device_connected', 'device_not_connected']) {
        final entries = controller[section];
        if (entries is! List) continue;
        for (final item in entries) {
          if (item is! Map) continue;
          for (final device in item.entries) {
            final name = device.key.toString();
            if (!name.toUpperCase().contains(targetName)) continue;
            final info = device.value;
            final props = info is Map ? info : <String, dynamic>{};
            final serviceText = props['device_services']?.toString() ?? '';
            final bracket = RegExp(r'<\s*([^>]+)\s*>').firstMatch(serviceText);
            final protocols = bracket == null
                ? <String>{}
                : bracket.group(1)!
                    .trim()
                    .split(RegExp(r'\s+'))
                    .where((x) => x.isNotEmpty)
                    .toSet();
            return BluetoothReading(
              connected: section == 'device_connected',
              name: name,
              protocols: protocols,
              firmware: props['device_firmwareVersion']?.toString(),
            );
          }
        }
      }
    }
    return null;
  }
}

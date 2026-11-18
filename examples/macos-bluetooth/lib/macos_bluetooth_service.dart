import 'package:flutter/services.dart';

import 'bluetooth_device.dart';

/// Calls a read-only native macOS Bluetooth endpoint.
///
/// It intentionally does not pair, connect, disconnect or change audio routes.
class MacosBluetoothService {
  const MacosBluetoothService();

  static const MethodChannel _channel =
      MethodChannel('headset_studio/paired_bluetooth');

  Future<List<BluetoothDeviceSnapshot>> listPairedDevices() async {
    final response = await _channel.invokeMethod<List<dynamic>>(
      'listPairedDevices',
    );

    if (response == null) return const [];

    return response.map((item) {
      if (item is! Map) {
        throw const FormatException('Expected a device map');
      }
      return BluetoothDeviceSnapshot.fromMap(item.cast<Object?, Object?>());
    }).toList(growable: false);
  }
}

import 'dart:async';
import 'dart:io';

/// Controls the macOS SYSTEM output volume, not a headphone-specific gain.
class MacAudioService {
  Future<int?> readSystemVolume() async {
    if (!Platform.isMacOS) return null;
    try {
      final result = await Process.run(
        '/usr/bin/osascript',
        ['-e', 'output volume of (get volume settings)'],
      ).timeout(const Duration(seconds: 6));
      if (result.exitCode != 0) return null;
      final volume = int.tryParse(result.stdout.toString().trim());
      if (volume == null || volume < 0 || volume > 100) return null;
      return volume;
    } catch (_) {
      return null;
    }
  }

  Future<bool> setSystemVolume(int volume) async {
    if (!Platform.isMacOS) return false;
    final safeVolume = volume.clamp(0, 100);
    try {
      final result = await Process.run(
        '/usr/bin/osascript',
        ['-e', 'set volume output volume $safeVolume'],
      ).timeout(const Duration(seconds: 6));
      return result.exitCode == 0;
    } catch (_) {
      return false;
    }
  }

  Future<bool> openSoundSettings() async {
    if (!Platform.isMacOS) return false;
    try {
      final result = await Process.run('/usr/bin/open', [
        'x-apple.systempreferences:com.apple.Sound-Settings.extension',
      ]).timeout(const Duration(seconds: 6));
      return result.exitCode == 0;
    } catch (_) {
      return false;
    }
  }
}

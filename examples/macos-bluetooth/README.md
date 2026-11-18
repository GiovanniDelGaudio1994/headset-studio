# Headset Studio — macOS Bluetooth read-only example

A **newly written, independent technical example** of a Flutter-to-Swift
platform channel for macOS. This is **not** a recovered file from an early
Headset Studio release and has **not been verified on the author's Mac**.

## What it does

- Flutter calls `listPairedDevices` through a `MethodChannel`.
- The Swift macOS host uses Apple's `IOBluetoothDevice.pairedDevices()`.
- Returns only a display name and a connection flag.
- Reads the set of **paired devices**, not a live scan for nearby hardware.
- Does not control the volume, audio route, pairing, firmware or Bluetooth
  connection; connection state is an OS snapshot, not an audio playback test.

## Trying the example in a new Flutter macOS project

1. Create a **separate** Flutter project on a Mac:
   `flutter create --platforms=macos headset_bluetooth_sample`
2. Copy `lib/bluetooth_device.dart` and
   `lib/macos_bluetooth_service.dart` into the generated `lib/` directory.
3. Replace the generated `macos/Runner/MainFlutterWindow.swift` with
   the file in this example. Review and manually merge changes if your Flutter
   template differs.
4. In the generated `macos/Runner/Info.plist`, add:
   ```xml
   <key>NSBluetoothAlwaysUsageDescription</key>
   <string>Show paired Bluetooth devices and their connection states.</string>
   ```
5. Review Bluetooth entitlement/sandbox configuration, OS privacy prompts
   and target SDK for your macOS build. Grant access when prompted; do not
   disable system protections.
6. Call from an app widget:
   ```dart
   final devices = await const MacosBluetoothService().listPairedDevices();
   ```
   Add imports for `macos_bluetooth_service.dart` and handle
   `PlatformException` and `FormatException` in your own UI.

The example is **source only**: it intentionally does not include a generated
Flutter macOS project, Xcode files, app bundle or release binary. Therefore
`flutter run` cannot be executed directly from this folder.

## Privacy and limitations

The API can expose paired peripherals beyond headphones. The code omits
MAC addresses and does not log or persist names, but device names may still
be sensitive and should not be uploaded as telemetry. Only display them to the
local user. Access and results may vary with macOS version, sandbox,
permissions, and Bluetooth device state. No claims are made for Windows,
Bluetooth LE scanning, headphone battery levels or Marshall-specific features.

References:
- [Flutter platform channels](https://docs.flutter.dev/platform-integration/platform-channels)
- [Apple IOBluetoothDevice](https://developer.apple.com/documentation/iobluetooth/iobluetoothdevice)

# Headset Studio — Original v0.2.1 source excerpts

These Dart files have been taken from the user-supplied archive
`HeadsetStudio_macOS_v0.2.1_3D_fixed.zip` (version `0.2.1+3`).
They are **original implementation files**, not demo reconstructions.

## Included

- [Bluetooth / battery service](lib/services/headphone_service.dart): macOS
  `system_profiler SPBluetoothDataType -json`, `pmset -g accps`, timeout
  handling, protocol parsing, nullable battery and error states.
- [macOS audio service](lib/services/mac_audio_service.dart): read/set the
  **system output** volume using AppleScript, and open sound settings.
- [Service tests](test/headphone_service_test.dart): original parsing cases
  with fixture data.
- [pubspec.yaml](pubspec.yaml): original Flutter project metadata.

## Publication scope

The original v0.2.1 archive also contains a 3D Flutter dashboard
(`lib/main.dart`), PNG artwork, an HTML preview, and a macOS setup script.
Those files have **not** been published in this excerpt. This folder is
therefore a **code review showcase, not a complete runnable application**.
It must not be presented as a downloadable macOS app or a full v0.2.1
release. The full archive remains separate.

These services are actual historical source files, while
`examples/early-ui` and `examples/macos-bluetooth` are independent
illustrative examples written later.

## Technical and privacy notes

The Bluetooth service targets the Major III by name; it is not generic
Bluetooth discovery. Battery reporting depends on the output of macOS
`pmset` and may be unavailable. The snapshot does not imply that the
selected output is the headphones. Audio volume affects the current
**system output device**, not headphone firmware.

The test input is an illustrative fixture embedded in the original
archive. It is not a live device reading.

Headset Studio is independent and not affiliated with or endorsed by
Marshall Group. Trademark mentions identify the test hardware only.

**Validation:** source files reviewed, but the tests have not been run
in this environment because Flutter is unavailable.

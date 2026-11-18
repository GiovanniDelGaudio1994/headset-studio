import Cocoa
import FlutterMacOS
import IOBluetooth

/// Example replacement for a freshly created Flutter macOS runner.
///
/// Exposes a read-only, one-shot list of *paired* Bluetooth devices.
/// This is not a scan for nearby devices and is not headset-specific.
class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = frame
    contentViewController = flutterViewController
    setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    let channel = FlutterMethodChannel(
      name: "headset_studio/paired_bluetooth",
      binaryMessenger: flutterViewController.engine.binaryMessenger
    )

    channel.setMethodCallHandler { call, result in
      guard call.method == "listPairedDevices" else {
        result(FlutterMethodNotImplemented)
        return
      }

      // macOS may require Bluetooth privacy permission. Never return device
      // hardware addresses to Dart or record them in logs.
      let paired = (IOBluetoothDevice.pairedDevices() ?? [])
        .compactMap { $0 as? IOBluetoothDevice }

      let snapshots: [[String: Any]] = paired.map { device in
        [
          "name": device.name ?? "Unnamed device",
          "connected": device.isConnected()
        ]
      }

      result(snapshots)
    }

    super.awakeFromNib()
  }
}

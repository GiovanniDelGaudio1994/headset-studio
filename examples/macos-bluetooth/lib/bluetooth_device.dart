/// A safe, display-oriented snapshot returned by the native macOS host.
class BluetoothDeviceSnapshot {
  const BluetoothDeviceSnapshot({
    required this.name,
    required this.connected,
  });
//QUA SEMBRA TUTTO OK
  final String name;
  final bool connected;

  factory BluetoothDeviceSnapshot.fromMap(Map<Object?, Object?> data) {
    final name = data['name'];
    final connected = data['connected'];
    if (name is! String || connected is! bool) {
      throw const FormatException('Invalid Bluetooth device payload');
    }
    return BluetoothDeviceSnapshot(name: name, connected: connected);
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:headset_studio/services/headphone_service.dart';

void main() {
  test('parses the actual 90% Major III battery, ignoring other accessories', () {
    const output = '''Now drawing from 'AC Power'
 -InternalBattery-0 (id=7471203) 84%; AC attached; not charging present: true
 -MX Keys Mini (id=19665808) 100%;
 -MX Master (id=19665807) 50%;
 -MAJOR III BLUETOOTH (id=10687381) 90%; discharging present: true
''';
    final result = HeadphoneService.parseAccps(output);
    expect(result?.percent, 90);
    expect(result?.charging, false);
  });

  test('returns null when headphones are not present', () {
    expect(HeadphoneService.parseAccps('-MX Master (id=2) 50%;'), isNull);
  });

  test('recognizes the connected device and its actual protocols', () {
    const output = '''{
      "SPBluetoothDataType": [{
        "device_connected": [{
          "MAJOR III BLUETOOTH": {
            "device_firmwareVersion": "0.0.0",
            "device_minorType": "Headphones",
            "device_services": "0x800019 < HFP AVRCP A2DP ACL >"
          }
        }]
      }]
    }''';
    final reading = HeadphoneService.parseBluetooth(output);
    expect(reading?.connected, true);
    expect(reading?.name, 'MAJOR III BLUETOOTH');
    expect(reading?.protocols, contains('A2DP'));
  });
}

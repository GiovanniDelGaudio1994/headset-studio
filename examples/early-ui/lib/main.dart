import 'package:flutter/material.dart';

void main() => runApp(const HeadsetStudioApp());

/// Public, self-contained UI sample. No Bluetooth or system audio APIs are used.
class HeadsetStudioApp extends StatelessWidget {
  const HeadsetStudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Headset Studio — Early UI Sample',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5565A8)),
        useMaterial3: true,
      ),
      home: const HeadsetDashboard(),
    );
  }
}

@immutable
class HeadsetViewState {
  const HeadsetViewState({
    required this.connected,
    required this.volume,
    this.deviceName = 'Demo Bluetooth Headphones',
  });

  final bool connected;
  final double volume;
  final String deviceName;

  HeadsetViewState copyWith({bool? connected, double? volume}) {
    return HeadsetViewState(
      connected: connected ?? this.connected,
      volume: volume ?? this.volume,
      deviceName: deviceName,
    );
  }
}

class HeadsetDashboard extends StatefulWidget {
  const HeadsetDashboard({super.key});

  @override
  State<HeadsetDashboard> createState() => _HeadsetDashboardState();
}

class _HeadsetDashboardState extends State<HeadsetDashboard> {
  HeadsetViewState _headset = const HeadsetViewState(
    connected: true,
    volume: 0.45,
  );

  void _setConnected(bool value) {
    setState(() => _headset = _headset.copyWith(connected: value));
  }

  void _setVolume(double value) {
    setState(() => _headset = _headset.copyWith(volume: value));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Headset Studio')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text('Early UI prototype', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              const Text(
                'A small Flutter demonstration using simulated device values. '
                'This example does not discover Bluetooth devices or change macOS audio.',
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.headphones, color: colors.primary, size: 38),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_headset.deviceName,
                                    style: Theme.of(context).textTheme.titleLarge),
                                Text(_headset.connected ? 'Connected (simulated)' : 'Disconnected (simulated)'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Simulated connection'),
                        subtitle: const Text('Toggle to preview the two connection states'),
                        value: _headset.connected,
                        onChanged: _setConnected,
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Icon(Icons.volume_up_outlined),
                          const SizedBox(width: 10),
                          const Text('Demo volume'),
                          const Spacer(),
                          Text('${(_headset.volume * 100).round()}%'),
                        ],
                      ),
                      Slider(
                        value: _headset.volume,
                        min: 0,
                        max: 1,
                        divisions: 20,
                        label: '${(_headset.volume * 100).round()}%',
                        onChanged: _headset.connected ? _setVolume : null,
                      ),
                      if (!_headset.connected)
                        const Text('Connect the simulated device to adjust the demo volume.'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Scope: widget composition, immutable view state, conditional UI, '
                'responsive layout and basic Material 3 styling.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

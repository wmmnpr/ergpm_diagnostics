import 'dart:async';

import 'package:ergpm_diagnostics/screens/bluetooth_off_screen.dart';
import 'package:ergpm_diagnostics/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() {
  runApp(MaterialApp(home: ErgPmDiagnosticsApp()));
}

class ErgPmDiagnosticsApp extends StatelessWidget {
  ErgPmDiagnosticsApp({super.key});

  final TextEditingController _outputTextController = TextEditingController();

  void _handleCheckConnected(BuildContext context) {
    _outputTextController.text += 'clicked _handleCheckConnected\n';
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const ScanPageWidget()));
  }

  void _handleConnect() {
    _outputTextController.text += 'clicked _handleConnect\n';
  }

  void _handleGoFinished() {
    _outputTextController.text += 'clicked _handleGoFinished\n';
  }

  void _handleGoReady() {
    _outputTextController.text += 'clicked _handleGoReady\n';
  }

  void _handleDisconnect() {
    _outputTextController.text += 'clicked _handleDisconnect\n';
  }

  @override
  Widget build(BuildContext context) {
    const title = 'PM Diagnostics';

    return MaterialApp(
      title: title,
      theme: ThemeData.dark().copyWith(primaryColor: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: const Text("Check"),
              trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Increase volume by 10',
                onPressed: () => _handleCheckConnected(context),
              ),
            ),
            ListTile(
              title: const Text("Connect"),
              trailing: IconButton(
                  icon: const Icon(Icons.start),
                  tooltip: 'Increase volume by 10',
                  onPressed: () => _handleConnect()),
            ),
            ListTile(
              title: const Text("Go Finished"),
              trailing: IconButton(
                  icon: const Icon(Icons.start),
                  tooltip: 'Increase volume by 10',
                  onPressed: () => _handleGoFinished()),
            ),
            ListTile(
              title: const Text("Go Ready"),
              trailing: IconButton(
                  icon: const Icon(Icons.start),
                  tooltip: 'Increase volume by 10',
                  onPressed: () => _handleGoReady()),
            ),
            ListTile(
              title: const Text("Start notification"),
              trailing: IconButton(
                  icon: const Icon(Icons.start),
                  tooltip: 'Increase volume by 10',
                  onPressed: () => _handleCheckConnected(context)),
            ),
            ListTile(
              title: const Text("Disconnect"),
              trailing: IconButton(
                  icon: const Icon(Icons.start),
                  tooltip: 'Increase volume by 10',
                  onPressed: () => _handleDisconnect()),
            ),
            TextField(
              controller: _outputTextController,
              readOnly: true,
              maxLines: 10, // Allows multiline input
              decoration: const InputDecoration(
                labelText: 'Output window',
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class ScanPageWidget extends StatefulWidget {
  const ScanPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }

  @override
  State<ScanPageWidget> createState() => _FlutterBlueAppState();
}

class _FlutterBlueAppState extends State<ScanPageWidget> {
  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;

  late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;

  @override
  void initState() {
    super.initState();
    _adapterStateStateSubscription =
        FlutterBluePlus.adapterState.listen((state) {
      _adapterState = state;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _adapterStateStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = _adapterState == BluetoothAdapterState.on
        ? const ScanScreen()
        : BluetoothOffScreen(adapterState: _adapterState);

    return MaterialApp(
      color: Colors.lightBlue,
      home: screen,
      navigatorObservers: [BluetoothAdapterStateObserver()],
    );
  }
}

//
// This observer listens for Bluetooth Off and dismisses the DeviceScreen
//
class BluetoothAdapterStateObserver extends NavigatorObserver {
  StreamSubscription<BluetoothAdapterState>? _adapterStateSubscription;

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.settings.name == '/DeviceScreen') {
      // Start listening to Bluetooth state changes when a new route is pushed
      _adapterStateSubscription ??=
          FlutterBluePlus.adapterState.listen((state) {
        if (state != BluetoothAdapterState.on) {
          // Pop the current route if Bluetooth is off
          navigator?.pop();
        }
      });
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // Cancel the subscription when the route is popped
    _adapterStateSubscription?.cancel();
    _adapterStateSubscription = null;
  }
}

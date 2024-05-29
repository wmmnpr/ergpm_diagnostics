import 'dart:async';

import 'package:ergpm_diagnostics/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = 'Initial Data';
  late BluetoothDevice activeDevice;

  late BluetoothCharacteristic _notificationEnablerCharacteristic;
  late BluetoothCharacteristic _bluetoothCharacteristic;
  late BluetoothCharacteristic _workoutProgressCharacteristic;
  late BluetoothCharacteristic _strokeDataCharacteristic;
  @override
  void initState() {
    super.initState();
    // Do any initial setup here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // This will be called when the widget is rebuilt
  }

  final TextEditingController _outputTextController = TextEditingController();

  Future<void> _handleSelectDevice(BuildContext context) async {
    _outputTextController.text += 'clicked _handleSelectDevice\n';

    BluetoothDevice returnedDevice = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScanScreen()),
    );
    if (returnedDevice != null) {
      _outputTextController.text += returnedDevice.toString();
      setState(() {
        activeDevice = returnedDevice;
      });
    }
  }

  void _handleConnect() {
    _outputTextController.text += 'clicked _handleConnect\n';
    ///////
    // listen for disconnection
    var subscription = activeDevice.connectionState
        .listen((BluetoothConnectionState state) async {
      if (state == BluetoothConnectionState.connected) {
        // 1. typically, start a periodic timer that tries to
        //    reconnect, or just call connect() again right now
        // 2. you must always re-discover services after disconnection!
        _outputTextController.text += activeDevice.connectionState.toString();

        Guid guid2902 = Guid("ce060022-43e5-11e4-916c-0800200c9a66");
        Guid guid21   = Guid("ce060021-43e5-11e4-916c-0800200c9a66");
        Guid guid32   = Guid("ce060032-43e5-11e4-916c-0800200c9a66");
        Guid guid35   = Guid("ce060035-43e5-11e4-916c-0800200c9a66");

        activeDevice
            .discoverServices()
            .then((List<BluetoothService> bluetoothServiceList) {
          for (BluetoothService service in bluetoothServiceList) {
            for (BluetoothCharacteristic characteristic
                in service.characteristics) {
              if (characteristic.characteristicUuid == guid21) {
                _outputTextController.text += "found guid21\n";
                _bluetoothCharacteristic = characteristic;
              } else if (characteristic.characteristicUuid == guid32) {
                _outputTextController.text += "found guid32\n";
                _workoutProgressCharacteristic = characteristic;
              }else if (characteristic.characteristicUuid == guid35) {
                _outputTextController.text += "found guid35\n";
                _strokeDataCharacteristic = characteristic;
              }else if (characteristic.characteristicUuid == guid2902) {
                _outputTextController.text += "found guid2902\n";
                _notificationEnablerCharacteristic = characteristic;
              }
            }
          }
        });
      }
    });
    ////////////
  }

  Future<void> sendCommand(List<int> payload, String name) async {
    List<int> buffer = List<int>.empty(growable: true);
    int checksum = 0;
    for (int i = 0; i < payload.length; i++) {
      checksum ^= payload[i];
    }
    for (int i = 0; i < payload.length; i++) {
      int value = payload[i];
      if (value >= 0xF0 && value <= 0xF3) {
        buffer.add(0xF3);
        buffer.add(value - 0xF0);
      } else {
        buffer.add(value);
      }
    }

    payload.insert(0, 0xF1);
    payload.add(checksum);
    payload.add(0xF2);

    return _bluetoothCharacteristic.write(payload);
  }

  void _handleSetupWorkout() {
    _outputTextController.text += 'clicked _handleSetupWorkout\n';
    int distance = 20;
    sendCommand([0x86], "GOFINISHED").then((v) => {
          sendCommand([0x87], "GOREADY").then((v) => {
                sendCommand([0x21, 0x03, distance, 0x00, 0x22], "SETHORIZONTAL")
                    .then((v) => {
                          sendCommand([
                            0x1A,
                            0x07,
                            0x05,
                            0x05,
                            0x80,
                            0x64,
                            0x00,
                            0x00,
                            0x00
                          ], "SETUSERCFG1")
                              .then((v) => {
                                    sendCommand([0x24, 0x02, 0x00, 0x00],
                                            "SETPROGRAM")
                                        .then((v) => {
                                              sendCommand([0x85], "GOINUSE")
                                                  .then((v) => {})
                                            })
                                  })
                        })
              })
        });
  }

  String intArrayToHex(List<int> intArray) {
    for (var value in intArray) {
      if (value < 0 || value > 255) {
        throw ArgumentError('All integers must be in the range 0-255.');
      }
    }

    // Convert each integer to a two-character hex string and concatenate them
    final hexStringBuffer = StringBuffer();
    for (var value in intArray) {
      hexStringBuffer.write(value.toRadixString(16).padLeft(2, '0'));
    }
    return hexStringBuffer.toString();
  }

  void _subscribeNotifications() {
    //_notificationEnablerCharacteristic.write(List.from([0x01,0x00]));
    _outputTextController.text += 'clicked _subscribeNotifications\n';
    _strokeDataCharacteristic.setNotifyValue(true);
    _strokeDataCharacteristic.onValueReceived.listen((data) {
      _outputTextController.text += '${intArrayToHex(data)}\n';
    }, onError: (error, stackTrace) {
      _outputTextController.text += "Error $error\n";
    }, onDone: () {
      _outputTextController.text += "listen Done\n";
    });
  }

  void _handleDisconnect() {
    _outputTextController.text += 'clicked _handleDisconnect\n';
  }

  @override
  Widget build(BuildContext context) {
    const title = 'PM Diagnostics';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text("Select Device"),
            trailing: IconButton(
              icon: const Icon(Icons.start),
              tooltip: 'Select Device',
              onPressed: () => _handleSelectDevice(context),
            ),
          ),
          ListTile(
            title: const Text("Connect"),
            trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Connect',
                onPressed: () => _handleConnect()),
          ),
          ListTile(
            title: const Text("Setup Workout"),
            trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Setup workout',
                onPressed: () => _handleSetupWorkout()),
          ),
          ListTile(
            title: const Text("Subscribe"),
            trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Subscribe Notification',
                onPressed: () => _subscribeNotifications()),
          ),
          ListTile(
            title: const Text("Start notification"),
            trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Increase volume by 10',
                onPressed: () => _handleSelectDevice(context)),
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
    );
  }
}

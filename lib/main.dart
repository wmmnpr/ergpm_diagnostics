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
  late BluetoothCharacteristic _bluetoothCharacteristic;

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

        activeDevice
            .discoverServices()
            .then((List<BluetoothService> bluetoothServiceList) => {
                  for (BluetoothService service in bluetoothServiceList)
                    {
                      for (BluetoothCharacteristic characteristic
                          in service.characteristics)
                        {
                          if (characteristic.characteristicUuid ==
                              Guid("ce060021-43e5-11e4-916c-0800200c9a66"))
                            {
                              //_outputTextController.text += "found characteristic:"
                              _bluetoothCharacteristic = characteristic
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

  void _handleGoFinished() {
    _outputTextController.text += 'clicked _handleGoFinished\n';
    int distance = 20;
    sendCommand([0x86], "GOFINISHED").then((v) => {
          sendCommand([0x87], "GOREADY").then((v) => {
                sendCommand([0x21, 0x03, distance, 0x00, 0x22], "SETHORIZONTAL")
                    .then((v) => {
                          sendCommand([0x1A, 0x07, 0x05, 0x05, 0x80, 0x64, 0x00, 0x00, 0x00], "SETUSERCFG1")
                              .then((v) => {
                                    sendCommand([0x24, 0x02, 0x00, 0x00], "SETPROGRAM")
                                        .then((v) => {
                                              sendCommand([0x85], "GOINUSE")
                                                  .then((v) => {})
                                            })
                                  })
                        })
              })
        });
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
              tooltip: 'Increase volume by 10',
              onPressed: () => _handleSelectDevice(context),
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

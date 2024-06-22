import 'dart:async';

import 'package:ergc2_pm_csafe/ergc2_pm_csafe.dart';
import 'package:ergpm_diagnostics/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

abstract class DeviceCharacteristic<T> extends PmBleCharacteristic<T> {
  BluetoothCharacteristic bluetoothCharacteristic;

  DeviceCharacteristic(this.bluetoothCharacteristic);

  @override
  void listen(StreamSink sink) {
    bluetoothCharacteristic.setNotifyValue(true);
    bluetoothCharacteristic.onValueReceived.listen((data) {
      sink.add(data);
    }, onError: (error, stackTrace) {
      sink.addError(error);
    }, onDone: () {
      sink.close();
    });
  }
}

class StrokeDataCharacteristic extends DeviceCharacteristic<StrokeData> {
  StrokeDataCharacteristic(super.characteristic);

  @override
  StrokeData create() {
    return StrokeData();
  }
}

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
  Map<int, DeviceCharacteristic> characteristics = {};
  late PmBLEDevice pmBLEDevice;

  late BluetoothCharacteristic _notificationEnablerCharacteristic;
  late BluetoothCharacteristic _bluetoothWriteCharacteristic;
  late BluetoothCharacteristic _bluetoothReadCharacteristic;
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

        Guid guid21 = Guid("ce060021-43e5-11e4-916c-0800200c9a66");
        Guid guid22 = Guid("ce060022-43e5-11e4-916c-0800200c9a66");
        Guid guid32 = Guid("ce060032-43e5-11e4-916c-0800200c9a66");
        Guid guid35 = Guid("ce060035-43e5-11e4-916c-0800200c9a66");

        activeDevice
            .discoverServices()
            .then((List<BluetoothService> bluetoothServiceList) {
          for (BluetoothService service in bluetoothServiceList) {
            for (BluetoothCharacteristic characteristic
                in service.characteristics) {
              //print("service: ${service.uuid} <==> ${characteristic.uuid}");
              if (characteristic.characteristicUuid == guid21) {
                _outputTextController.text += "found guid21\n";
                _bluetoothWriteCharacteristic = characteristic;
              } else if (characteristic.characteristicUuid == guid32) {
                _outputTextController.text += "found guid32\n";
                _workoutProgressCharacteristic = characteristic;
              } else if (characteristic.characteristicUuid == guid35) {
                _outputTextController.text += "found guid35\n";
                _strokeDataCharacteristic = characteristic;
                characteristics[0x35] =
                    StrokeDataCharacteristic(characteristic);
              } else if (characteristic.characteristicUuid == guid22) {
                _outputTextController.text += "found guid22\n";
                _bluetoothReadCharacteristic = characteristic;
              }
            }
          }
          pmBLEDevice = PmBLEDevice(characteristics);
        });
      }
    });
    ////////////
  }

  List<int> hexStringToIntArray(String hex) {
    // Ensure the string length is even
    if (hex.length % 2 != 0) {
      throw FormatException('Hex string must have an even length');
    }

    // Initialize an empty list to store the integers
    List<int> intArray = [];

    // Loop through the hex string, taking 2 characters at a time
    for (int i = 0; i < hex.length; i += 2) {
      // Get the hex substring (2 characters)
      String hexPair = hex.substring(i, i + 2);

      // Convert the hex pair to an integer and add to the list
      int value = int.parse(hexPair, radix: 16);
      intArray.add(value);
    }

    return intArray;
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

    return _bluetoothWriteCharacteristic.write(payload);
  }

  void _handleSetupWorkout() {
    _outputTextController.text += 'clicked _handleSetupWorkout\n';
    int distance = 1;
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
    pmBLEDevice.subscribe<StrokeData>(StrokeData.uuid).listen((strokeData) {
      String dataStr = strokeData.toJson().toString();
      print("StrokeData -> $dataStr");
    }, onError: (error) {
      print(error);
    }, onDone: () {
      print("StrokeData done.");
    });
  }

  void _handleReadCharacteristic() {
    _bluetoothReadCharacteristic.setNotifyValue(true);
    _outputTextController.text += 'clicked _handleReadCharacteristic\n';
    _bluetoothReadCharacteristic.onValueReceived.listen((v2) {
      print("Received:${intArrayToHex(v2)}\n");
    });
  }

  void _handleDisconnect() {
    int ctr = 0;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      print('CSAFE_GETHORIZONTAL_CMD\n');
      sendCommand([0xa1], "CSAFE_GETHORIZONTAL_CMD").then((v1) {
        print("CSAFE_GETHORIZONTAL_CMD OK");
      });
      if (ctr++ > 70) {
        timer.cancel();
      }
    });
  }

  void _sendCommandOnPush() {
    String payload = _outputTextController.value.text;
    var arrPayload = hexStringToIntArray(payload);
    _bluetoothWriteCharacteristic.write(arrPayload).then((value) {},
        onError: (err, stack) {
      print(err);
    });
  }

  void _CheckSumOnPush() {
    String payloadText = _outputTextController.value.text;
    List<int> payload = hexStringToIntArray(payloadText.replaceAll(":", ""));
    int checksum = 0;
    for (int i = 0; i < payload.length; i++) {
      checksum ^= payload[i];
    }
    _outputTextController.text +=
        "checksum=" + checksum.toRadixString(16).padLeft(2, '0');
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
            title: const Text("Read 0x0022 char"),
            trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Increase volume by 10',
                onPressed: () => _handleReadCharacteristic()),
          ),
          ListTile(
            title: const Text("get horizontal"),
            trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Increase volume by 10',
                onPressed: () => _handleDisconnect()),
          ),
          ListTile(
            title: const Text("Send Command"),
            trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Increase volume by 10',
                onPressed: () => _sendCommandOnPush()),
          ),
          ListTile(
            title: const Text("Check Sum"),
            trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Check sum on push',
                onPressed: () => _CheckSumOnPush()),
          ),
          TextField(
            controller: _outputTextController,
            readOnly: false,
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

import 'dart:async';

import 'package:ergc2_pm_csafe/ergc2_pm_csafe.dart';
import 'package:ergpm_diagnostics/pm_ble_characteristic.dart';
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
  Map<int, DeviceCharacteristic> characteristics = {};
  late PmBLEDevice pmBLEDevice;
  late List<String> dropdownUuidRead = <String>["empty"];
  late String dropdownUuidReadValue;
  late List<String> dropdownUuidWrite = <String>["empty"];
  late String dropdownUuidWriteValue;

  late BluetoothCharacteristic _notificationEnablerCharacteristic;
  late BluetoothCharacteristic _bluetoothReadCharacteristic;
  late BluetoothCharacteristic _workoutProgressCharacteristic;

  @override
  void initState() {
    super.initState();
    dropdownUuidReadValue = dropdownUuidRead.first;
    dropdownUuidWriteValue = dropdownUuidWrite.first;
    // Do any initial setup here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // This will be called when the widget is rebuilt
  }

  final TextEditingController _outputTextController = TextEditingController();

  void _updateDropdownItems(List<String> items) {
    setState(() {
      dropdownUuidRead = items;
      dropdownUuidReadValue = dropdownUuidRead.first;
      dropdownUuidWrite = items;
      dropdownUuidWriteValue = dropdownUuidWrite.first;
    });
  }

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

        List<String> uuidList = [];
        activeDevice
            .discoverServices()
            .then((List<BluetoothService> bluetoothServiceList) {
          for (BluetoothService service in bluetoothServiceList) {
            print("------>service: ${service.uuid}");
            for (BluetoothCharacteristic characteristic
                in service.characteristics) {
              //print("service: ${service.uuid} <==> ${characteristic.uuid}");
              uuidList.add(characteristic.uuid.str);
              if (characteristic.characteristicUuid == guid21) {
                _outputTextController.text += "found guid21\n";
                characteristics[characteristic.uuid.hashCode] =
                    CsafeBufferCharacteristic(characteristic);
              } else if (characteristic.characteristicUuid == guid32) {
                _outputTextController.text += "found guid32\n";
                _workoutProgressCharacteristic = characteristic;
              } else if (characteristic.characteristicUuid == guid35) {
                _outputTextController.text += "found guid35\n";
                characteristics[characteristic.uuid.hashCode] =
                    StrokeDataCharacteristic(characteristic);
              } else if (characteristic.characteristicUuid == guid22) {
                _outputTextController.text += "found guid22\n";
                characteristics[characteristic.uuid.hashCode] =
                    CsafeBufferCharacteristic(characteristic);
              } else {
                characteristics[characteristic.uuid.hashCode] =
                    CsafeBufferCharacteristic(characteristic);
              }
            }
          }
          _updateDropdownItems(uuidList);
          pmBLEDevice = PmBLEDevice(characteristics);
        });
      }
    });
    ////////////
  }

  void _handleSetupWorkout() {
    _outputTextController.text += 'clicked _handleSetupWorkout\n';
    int selectedUuid = dropdownUuidWriteValue.hashCode;
    int distance = 1;
    pmBLEDevice.sendCommand(selectedUuid, [0x86], "GOFINISHED").then((v) => {
          pmBLEDevice.sendCommand(selectedUuid, [0x87], "GOREADY").then((v) => {
                pmBLEDevice
                    .sendCommand(selectedUuid,
                        [0x21, 0x03, distance, 0x00, 0x22], "SETHORIZONTAL")
                    .then((v) => {
                          pmBLEDevice
                              .sendCommand(
                                  selectedUuid,
                                  [
                                    0x1A,
                                    0x07,
                                    0x05,
                                    0x05,
                                    0x80,
                                    0x64,
                                    0x00,
                                    0x00,
                                    0x00
                                  ],
                                  "SETUSERCFG1")
                              .then((v) => {
                                    pmBLEDevice
                                        .sendCommand(
                                            dropdownUuidWriteValue.hashCode,
                                            [0x24, 0x02, 0x00, 0x00],
                                            "SETPROGRAM")
                                        .then((v) => {
                                              pmBLEDevice
                                                  .sendCommand(
                                                      dropdownUuidWriteValue
                                                          .hashCode,
                                                      [0x85],
                                                      "GOINUSE")
                                                  .then((v) => {})
                                            })
                                  })
                        })
              })
        });
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
    _outputTextController.text += 'clicked _handleReadCharacteristic\n';
    pmBLEDevice
        .readCharacteristic(dropdownUuidReadValue.hashCode)
        .then((value) {
      _outputTextController.text += "${DataConvUtils.intArrayToHex(value)}\n";
      print("Received:${String.fromCharCodes(value)}\n");
    }).onError((error, stackTrace) {
      _outputTextController.text += "$error\n";
      print("Error read: $error");
    });
  }

  void _handleSubscribeSelected() {
    //_notificationEnablerCharacteristic.write(List.from([0x01,0x00]));
    _outputTextController.text += 'clicked _handleSubscribeSelected\n';
    pmBLEDevice.subscribe<CsafeBuffer>(dropdownUuidReadValue.hashCode).listen(
        (csafeBuffer) {
      String dataStr = csafeBuffer.toJson().toString();
      print("Csafe buffer -> $dataStr");
    }, onError: (error) {
      print(error);
    }, onDone: () {
      print("Csafe done.");
    });
  }

  void _sendCommandOnPush() {
    String payload = _outputTextController.value.text.replaceAll("\n", "");
    var arrPayload = DataConvUtils.hexStringToIntArray(payload);
    pmBLEDevice
        .sendCommand(dropdownUuidWriteValue.hashCode, arrPayload, "ANY")
        .whenComplete(() => print("done sending any coommand"));
  }

  void _CheckSumOnPush() {
    String payloadText = _outputTextController.value.text;
    List<int> payload =
        DataConvUtils.hexStringToIntArray(payloadText.replaceAll(":", ""));
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
            title: const Text("Read selected characteristic"),
            trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Read characteristic0x0022',
                onPressed: () => _handleReadCharacteristic()),
          ),
          ListTile(
            title: const Text("Subscribe selected"),
            trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Increase volume by 10',
                onPressed: () => _handleSubscribeSelected()),
          ),
          ListTile(
            title: const Text("Send command in box"),
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
          ListTile(
            title: const Text("Read Characteristic"),
            trailing: DropdownButton<String>(
              value: dropdownUuidReadValue,
              icon: const Icon(Icons.list),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownUuidReadValue = value!;
                });
              },
              items: dropdownUuidRead
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: const Text("Write Characteristic"),
            trailing: DropdownButton<String>(
              value: dropdownUuidWriteValue,
              icon: const Icon(Icons.list),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownUuidWriteValue = value!;
                });
              },
              items: dropdownUuidWrite
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
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

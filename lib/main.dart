import 'dart:async';
import 'dart:convert';

import 'package:ergpm_diagnostics/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class StrokeData {
  int elapsedTime = 0;
  double distance = 0;
  double driveLength = 0;
  int driveTime = 0;
  int strokeRecoveryTime = 0;
  double strokeDistance = 0;
  double peakDriveForce = 0;
  double averageDriveForce = 0;
  double workPerStroke = 0;
  int strokeCount = 0;

  Map<String, dynamic> toJson() {
    return {
      'elapsedTime': elapsedTime,
      'distance': distance,
      'driveLength': driveLength,
      'driveTime': driveTime,
      'strokeRecoveryTime': strokeRecoveryTime,
      'strokeDistance': strokeDistance,
      'peakDriveForce': peakDriveForce,
      'averageDriveForce': averageDriveForce,
      'workPerStroke': workPerStroke,
      'strokeCount': strokeCount
    };
  }
}

enum StrokeDataBLEPayload {
  ELAPSED_TIME_LO,
  ELAPSED_TIME_MID,
  ELAPSED_TIME_HI,
  DISTANCE_LO,
  DISTANCE_MID,
  DISTANCE_HI,
  DRIVE_LENGTH,
  DRIVE_TIME,
  STROKE_RECOVERY_TIME_LO,
  STROKE_RECOVERY_TIME_HI,
  STROKE_DISTANCE_LO,
  STROKE_DISTANCE_HI,
  PEAK_DRIVE_FORCE_LO,
  PEAK_DRIVE_FORCE_HI,
  AVG_DRIVE_FORCE_LO,
  AVG_DRIVE_FORCE_HI,
  WORK_PER_STROKE_LO,
  WORK_PER_STROKE_HI,
  STROKE_COUNT_LO,
  STROKE_COUNT_HI,
  BLE_PAYLOAD_SIZE
}


class AdditionalStatus2 {
  int elapsedTime = 0;
  double distance = 0;
  double driveLength = 0;
  int driveTime = 0;
  int strokeRecoveryTime = 0;
  double strokeDistance = 0;
  double peakDriveForce = 0;
  double averageDriveForce = 0;
  double workPerStroke = 0;
  int strokeCount = 0;

  Map<String, dynamic> toJson() {
    return {
      'elapsedTime': elapsedTime,
      'distance': distance,
      'driveLength': driveLength,
      'driveTime': driveTime,
      'strokeRecoveryTime': strokeRecoveryTime,
      'strokeDistance': strokeDistance,
      'peakDriveForce': peakDriveForce,
      'averageDriveForce': averageDriveForce,
      'workPerStroke': workPerStroke,
      'strokeCount': strokeCount
    };
  }
}

enum AdditionalStatus2DataBLEPayload {
  ELAPSED_TIME_LO,
  ELAPSED_TIME_MID,
  ELAPSED_TIME_HI,
  DISTANCE_LO,
  DISTANCE_MID,
  DISTANCE_HI,
  DRIVE_LENGTH,
  DRIVE_TIME,
  STROKE_RECOVERY_TIME_LO,
  STROKE_RECOVERY_TIME_HI,
  STROKE_DISTANCE_LO,
  STROKE_DISTANCE_HI,
  PEAK_DRIVE_FORCE_LO,
  PEAK_DRIVE_FORCE_HI,
  AVG_DRIVE_FORCE_LO,
  AVG_DRIVE_FORCE_HI,
  WORK_PER_STROKE_LO,
  WORK_PER_STROKE_HI,
  STROKE_COUNT_LO,
  STROKE_COUNT_HI,
  BLE_PAYLOAD_SIZE
}


StrokeData intListToStrokeData(List<int> intList) {
  StrokeData strokeData = StrokeData();
  // @formatter:off
  strokeData.elapsedTime = DataConvUtils.getUint24(intList, StrokeDataBLEPayload.ELAPSED_TIME_LO.index) * 10;
  strokeData.distance = DataConvUtils.getUint24(intList, StrokeDataBLEPayload.DISTANCE_LO.index) / 10;
  strokeData.driveLength = DataConvUtils.getUint8(intList, StrokeDataBLEPayload.DRIVE_LENGTH.index) / 100;
  strokeData.driveTime = DataConvUtils.getUint8(intList, StrokeDataBLEPayload.DRIVE_TIME.index) * 10;
  strokeData.strokeRecoveryTime = (DataConvUtils.getUint8(intList, StrokeDataBLEPayload.STROKE_RECOVERY_TIME_LO.index)
                                      + DataConvUtils.getUint8(intList, StrokeDataBLEPayload.STROKE_RECOVERY_TIME_HI.index) * 256) * 10;
  strokeData.strokeDistance = DataConvUtils.getUint16(intList, StrokeDataBLEPayload.STROKE_DISTANCE_LO.index) / 100;
  strokeData.peakDriveForce = DataConvUtils.getUint16(intList, StrokeDataBLEPayload.PEAK_DRIVE_FORCE_LO.index) / 10;
  strokeData.averageDriveForce = DataConvUtils.getUint16(intList, StrokeDataBLEPayload.AVG_DRIVE_FORCE_LO.index) / 10;
  strokeData.workPerStroke = DataConvUtils.getUint16(intList, StrokeDataBLEPayload.WORK_PER_STROKE_LO.index) / 10;
  strokeData.strokeCount = DataConvUtils.getUint8(intList, StrokeDataBLEPayload.STROKE_COUNT_LO.index)
                                      + DataConvUtils.getUint8(intList,  StrokeDataBLEPayload.STROKE_COUNT_HI.index) * 256;
  // @formatter:on
  return strokeData;
}

class DataConvUtils {
  static int getUint8(List<int> data, int offset) {
    return data[offset];
  }

  static int getUint16(List<int> data, int offset) {
    return data[offset + 1] << 8 + data[offset];
  }

  static int getUint24(List<int> data, int offset) {
    return (data[offset + 2] << 16) + (data[offset + 1] << 8) + (data[offset]);
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
              } else if (characteristic.characteristicUuid == guid22) {
                _outputTextController.text += "found guid22\n";
                _bluetoothReadCharacteristic = characteristic;
              }
            }
          }
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
    sendCommand([0x86], "GOFINISHED").then((v) =>
    {
      sendCommand([0x87], "GOREADY").then((v) =>
      {
        sendCommand([0x21, 0x03, distance, 0x00, 0x22], "SETHORIZONTAL")
            .then((v) =>
        {
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
              .then((v) =>
          {
            sendCommand([0x24, 0x02, 0x00, 0x00],
                "SETPROGRAM")
                .then((v) =>
            {
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
      String hexData = '${intArrayToHex(data)}\n';
      String strokeData = json.encode(intListToStrokeData(data).toJson());
      print("$hexData -> $strokeData");
    }, onError: (error, stackTrace) {
      _outputTextController.text += "Error $error\n";
    }, onDone: () {
      _outputTextController.text += "listen Done\n";
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
    _bluetoothWriteCharacteristic.write(arrPayload).then((value) {}
        , onError: (err, stack)  {
        print(err);
    });
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
          ), ListTile(
            title: const Text("Send Command"),
            trailing: IconButton(
                icon: const Icon(Icons.start),
                tooltip: 'Increase volume by 10',
                onPressed: () => _sendCommandOnPush()),

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

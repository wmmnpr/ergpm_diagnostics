import 'dart:async';

import 'package:ergpm_diagnostics/screens/bluetooth_off_screen.dart';
import 'package:ergpm_diagnostics/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String data = 'Initial Data';

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

  Future<void> _handleCheckConnected(BuildContext context) async {
    _outputTextController.text += 'clicked _handleCheckConnected\n';

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScanScreen()),
    );
    if (result != null) {
      _outputTextController.text += result;
      setState(() {
        data =
            result; // Update the state with the result from the second screen
      });
    }
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

    return Scaffold(
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
    );
  }
}


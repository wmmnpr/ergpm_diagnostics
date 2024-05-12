import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TextEditingController _outputTextController = TextEditingController();

  void _handleCheckConnected() {
    _outputTextController.text += 'clicked';
    print('Button pressed for');
  }

  void _handleConnect() {
    print('Button pressed for');
  }

  void _handleGoFinished() {}

  void _handleGoReady() {}

  void _handleDisconnect() {}

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
                onPressed: () => _handleCheckConnected(),
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
                  onPressed: () => _handleCheckConnected()),
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

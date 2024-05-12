import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  void _handleCheckConnected() {
    print('Button pressed for');
  }

  void _handleConnect() {
    print('Button pressed for');
  }

  void _handleGoFinished(){

  }

  void _handleGoReady(){

  }

  void _handleDisconnect(){

  }

  @override
  Widget build(BuildContext context) {
    const title = 'PM Diagnostics';

    return MaterialApp(
      title: title,

      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: const Text("Check"),
              trailing: ElevatedButton(
                onPressed: () => _handleCheckConnected(),
                child: const Text('Button'),
              ),
            ),
            ListTile(
              title: const Text("Connect"),
              trailing: ElevatedButton(
                onPressed: () => _handleConnect,
                child: const Text('Button'),
              ),
            ),
            ListTile(
              title: const Text("Go Finished"),
              trailing: ElevatedButton(
                onPressed: () => _handleGoFinished(),
                child: const Text('Button'),
              ),
            ),
            ListTile(
              title: const Text("Go Ready"),
              trailing: ElevatedButton(
                onPressed: () => _handleGoReady(),
                child: const Text('Button'),
              ),
            ),
            ListTile(
              title: const Text("Start notification"),
              trailing: ElevatedButton(
                onPressed: () => _handleCheckConnected(),
                child: const Text('Button'),
              ),
            ),
            ListTile(
              title: const Text("Disconnect"),
              trailing: ElevatedButton(
                onPressed: () => _handleDisconnect(),
                child: const Text('Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

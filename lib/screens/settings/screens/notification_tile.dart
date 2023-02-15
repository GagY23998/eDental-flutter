import 'package:edental/main.dart';
import 'package:edental/screens/tab_screen.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({super.key});

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool _pushNotificationsEnabled = true;
  bool _newsletterEnabled = false;
  bool _darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Obavještenja',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text('Push obavještenja', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 8.0),
            SwitchListTile(
              title: Text('Uključeno'),
              value: _pushNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _pushNotificationsEnabled = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Pretplati se na newsletter',
                style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 8.0),
            SwitchListTile(
              title: Text('Uključeno'),
              value: _newsletterEnabled,
              onChanged: (value) {
                setState(() {
                  _newsletterEnabled = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Tema', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 8.0),
            SwitchListTile(
              title: Text('Noćni mod'),
              value: _darkThemeEnabled,
              onChanged: (value) {
                setState(() {
                  _darkThemeEnabled = value;
                });
                if (_darkThemeEnabled) {
                  MaterialApp(
                    theme: ThemeData.dark(),
                    home: TabScreen(),
                  );
                } else {
                  // Set the app's theme to light
                  MaterialApp(
                    theme: ThemeData.light(),
                    home: TabScreen(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

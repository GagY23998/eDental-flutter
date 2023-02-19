// napravit account screen tab
// unutar kojeg treba imati koristnik pregled slike profila
// mogućnost promjene informacija (ime,prezime itd.)
// napraviti 2 slidebara kojim bi uključilo/isključilo - NAPOMENA- ovo još nije sigurno hoće li se praviti ali bi bio dobar feature
// napomena za nadolezeći termnin i za kontorlu nakon 2 mjeseca
import 'package:edental/screens/settings/screens/arrangements_tile.dart';
import 'package:edental/screens/settings/screens/notification_tile.dart';
import 'package:edental/screens/settings/screens/profile_tile.dart';
import 'package:edental/screens/settings/screens/help_tile.dart';
import 'package:edental/screens/settings/screens/about_tile.dart';
import 'package:edental/screens/settings/screens/notification_tile.dart';
import 'package:edental/screens/settings/widgets/uneditable_photo.dart';
import 'package:flutter/material.dart';
import 'package:edental/screens/settings/models/settings.dart';
import 'package:edental/screens/settings/widgets/uneditable_photo.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:edental/models/user.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const UneditableProfilePhoto(),
          SettingsTile(
              title: 'Your appointments',
              icon: Icons.lock_clock,
              destination: AddArrangementScreen()),
          const SettingsTile(
              title: 'Profile', icon: Icons.person, destination: ProfileTile()),
          const SettingsTile(
              title: 'Notifications',
              icon: Icons.notifications,
              destination: NotificationTile()),
          SettingsTile(
              title: 'Help', icon: Icons.book, destination: HelpTile()),
          const SettingsTile(
              title: 'About us', icon: Icons.book, destination: AboutTile()),
          const SettingsTile(
              title: 'Log out', icon: Icons.logout, destination: ProfileTile()),
        ],
      ),
    );
  }
}

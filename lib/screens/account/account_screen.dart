// napravit account screen tab
// unutar kojeg treba imati koristnik pregled slike profila
// mogućnost promjene informacija (ime,prezime itd.)
// napraviti 2 slidebara kojim bi uključilo/isključilo - NAPOMENA- ovo još nije sigurno hoće li se praviti ali bi bio dobar feature
// napomena za nadolezeći termnin i za kontorlu nakon 2 mjeseca
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Text('Accounts'),
    );
  }
}

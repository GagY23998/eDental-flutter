import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../providers/auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Flexible(flex: 1, child: Text('eDental')),
        Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: SizedBox(
                  height: deviceSize.height / 2,
                  width: deviceSize.width / 2,
                  child: AuthLogin()),
            ))
      ]),
    );
  }
}

enum AuthState {
  Login,
  Register,
}

class AuthLogin extends StatefulWidget {
  const AuthLogin({super.key});

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  final TextEditingController _username = TextEditingController(text: 'gagi');
  final TextEditingController _password = TextEditingController(text: 'gigi');
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Consumer<Auth>(
      builder: (context, value, child) {
        bool isAuthenticated = value.isAuthenticated;
        return Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _username,
              ),
              TextFormField(
                obscureText: true,
                controller: _password,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () =>
                          value.authenticate(_username.text, _password.text),
                      child: const Text('Login')),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          textStyle: const TextStyle(color: Colors.black)),
                      onPressed: () {},
                      child: const Text('Register'))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
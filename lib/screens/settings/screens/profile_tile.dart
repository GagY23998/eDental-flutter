import 'package:edental/screens/settings/widgets/editable_photo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:edental/screens/settings/widgets/profile_textfield.dart';

class ProfileTile extends StatefulWidget {
  const ProfileTile({super.key});

  @override
  State<ProfileTile> createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  late final TextEditingController _nameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _cityController;
  late String _name;
  late String _username;
  late String _password;
  late String _city;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _cityController = TextEditingController();
    _name = '';
    _username = '';
    _password = '';
    _city = '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    setState(() {
      _name = _nameController.text;
      _username = _usernameController.text;
      _password = _passwordController.text;
      _city = _cityController.text;
    });
  }

  void _discardChanges() {
    setState(() {
      _nameController.text = _name;
      _usernameController.text = _username;
      _passwordController.text = _password;
      _cityController.text = _city;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60.0, 0, 60.0, 0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus;
          },
          child: ListView(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const EditableProfilePhoto(),
              ProfileTextfield(
                  label: 'Ime i prezime',
                  placeholder: 'Unesite vaše ime i prezime',
                  isPasswordTextfield: false,
                  controller: _nameController),
              ProfileTextfield(
                label: 'Korisničko ime',
                placeholder: 'Unesite vaše korisničko ime',
                isPasswordTextfield: false,
                controller: _usernameController,
              ),
              ProfileTextfield(
                label: 'Lozinka',
                placeholder: 'Unesite vašu lozinku',
                isPasswordTextfield: true,
                controller: _passwordController,
              ),
              ProfileTextfield(
                label: 'Grad',
                placeholder: 'Unesite grad u kojem ste nastanjeni',
                isPasswordTextfield: false,
                controller: _cityController,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Otkaži'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Prihvati'),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

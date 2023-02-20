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
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _addressController;
  late final TextEditingController _passwordController;
  late final TextEditingController _emailController;
  late final TextEditingController _cityController;
  late final TextEditingController _phoneController;
  late String _firstName;
  late String _username;
  late String _password;
  late String _city;
  late String _lastName;
  late String _email;
  late String _phone;
  late String _address;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _cityController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _firstName = '';
    _lastName = '';
    _username = '';
    _password = '';
    _city = '';
    _phone = '';
    _address = '';
    _email = '';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    setState(() {
      _firstName = _firstNameController.text;
      _lastName = _lastNameController.text;
      _username = _usernameController.text;
      _address = _addressController.text;
      _email = _emailController.text;
      _phone = _phoneController.text;
      _password = _passwordController.text;
      _city = _cityController.text;
    });
  }

  void _discardChanges() {
    setState(() {
      _firstNameController.text = _firstName;
      _lastNameController.text = _lastName;
      _usernameController.text = _username;
      _passwordController.text = _password;
      _cityController.text = _city;
      _emailController.text = _email;
      _addressController.text = _address;
      _phoneController.text = _phone;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(60.0, 0, 60.0, 0),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus;
            },
            child: ListView(
              shrinkWrap: true,
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
                    label: 'First name',
                    placeholder: 'Enter your first name',
                    isPasswordTextfield: false,
                    controller: _firstNameController),
                ProfileTextfield(
                    label: 'Last name',
                    placeholder: 'Enter your last name',
                    isPasswordTextfield: false,
                    controller: _lastNameController),
                ProfileTextfield(
                  label: 'Username',
                  placeholder: 'Username',
                  isPasswordTextfield: false,
                  controller: _usernameController,
                ),
                ProfileTextfield(
                  label: 'Password',
                  placeholder: 'Your pasword',
                  isPasswordTextfield: true,
                  controller: _passwordController,
                ),
                ProfileTextfield(
                  label: 'City',
                  placeholder: 'City that you live in',
                  isPasswordTextfield: false,
                  controller: _cityController,
                ),
                ProfileTextfield(
                  label: 'Email',
                  placeholder: 'Enter your email address',
                  isPasswordTextfield: false,
                  controller: _emailController,
                ),
                ProfileTextfield(
                  label: 'Address',
                  placeholder: 'Address where you live in',
                  isPasswordTextfield: false,
                  controller: _addressController,
                ),
                ProfileTextfield(
                    label: 'Phone',
                    placeholder: 'Your phone number',
                    isPasswordTextfield: false,
                    controller: _phoneController),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Dispose'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Accept'),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

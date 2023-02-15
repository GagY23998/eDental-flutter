import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditableProfilePhoto extends StatefulWidget {
  const EditableProfilePhoto({
    Key? key,
  }) : super(key: key);

  @override
  State<EditableProfilePhoto> createState() => _EditableProfilePhotoState();
}

class _EditableProfilePhotoState extends State<EditableProfilePhoto> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  Future getImage() async {
    await _picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/dummy.png'),
              ),
              Positioned(
                bottom: 20.0,
                right: 25.0,
                child: InkWell(
                  onTap: (() {
                    getImage();
                  }),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.greenAccent,
                    size: 28.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.bottomCenter,
          child: Text(
            'username',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
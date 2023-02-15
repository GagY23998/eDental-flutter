import 'package:flutter/material.dart';

class UneditableProfilePhoto extends StatelessWidget {
  const UneditableProfilePhoto({
    Key? key,
  }) : super(key: key);

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

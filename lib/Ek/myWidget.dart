import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myWidget extends StatelessWidget {
  final String text;
  final IconData icon1;
  myWidget({required this.text, required this.icon1});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon1,
          color: Colors.pink,
          size: 60,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

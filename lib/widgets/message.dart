import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  String message;

  Message(this.message);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Center(
          child: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 40),
      )),
    );
  }
}

import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override 
  Widget build(BuildContext context) {
    return const Text(
      'Parler à Homer',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      )
    );
  }
}
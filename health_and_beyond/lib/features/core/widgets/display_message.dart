import 'package:flutter/material.dart';

class DisplayMessage extends StatelessWidget {
  final String message;

  DisplayMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text(message)));
  }
}

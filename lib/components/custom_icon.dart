import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  final String iconName;
  CustomIcons({required this.iconName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Image.asset('assets/icons/$iconName.png'),
    );
  }
}

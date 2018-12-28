import 'package:flutter/material.dart';

class CompanyAvatar extends StatelessWidget {
  static const radius = 38.0;

  final String src;

  const CompanyAvatar({
    this.src
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
                width: 2.0, color: Color.fromARGB(255, 210, 210, 210))),
        child: Image.network(src));
  }
}

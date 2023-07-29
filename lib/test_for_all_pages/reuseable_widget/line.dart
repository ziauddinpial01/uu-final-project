import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 6,
    width: double.infinity,
    color: Colors.grey.withOpacity(0.3));
  }
}
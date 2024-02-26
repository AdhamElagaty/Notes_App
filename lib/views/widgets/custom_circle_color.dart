import 'package:flutter/material.dart';

class CustomCircleColor extends StatelessWidget {
  const CustomCircleColor({
    super.key,
    required this.isLoading,
    required this.color,
  });

  final bool isLoading;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 40,
            backgroundColor: color,
          );
  }
}

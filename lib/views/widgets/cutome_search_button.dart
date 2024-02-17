import 'package:flutter/material.dart';

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Icon(
          Icons.search,
          size: 32,
        ),
      ),
    );
  }
}

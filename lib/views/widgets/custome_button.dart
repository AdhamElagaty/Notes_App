import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({
    super.key,
    required this.isLoading,
    required this.textButton,
    required this.onTap,
  });

  final bool isLoading;
  final String textButton;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(kPrimaryColor),
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ))
              : Text(
                  textButton,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}

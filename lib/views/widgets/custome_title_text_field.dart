import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomeTitleTextField extends StatelessWidget {
  const CustomeTitleTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.height,
    this.width,
    this.maxLength,
  });

  final String hintText;
  final String labelText;
  final double? width;
  final double? height;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        maxLines: null,
        maxLength: maxLength,
        expands: (height != null) ? true : false,
        onChanged: (data) {},
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          counterText: "",
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(kPrimaryColor),
          ),
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

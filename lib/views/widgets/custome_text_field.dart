import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.onSaved,
    this.onChanged,
    this.height,
    this.width,
    this.maxLength,
    this.initialValue,
  });

  final String hintText;
  final String labelText;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final double? width;
  final double? height;
  final int? maxLength;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        onSaved: onSaved,
        onChanged: onChanged,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is required!";
          }
          return null;
        },
        initialValue: initialValue,
        maxLines: null,
        maxLength: maxLength,
        expands: (height != null) ? true : false,
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

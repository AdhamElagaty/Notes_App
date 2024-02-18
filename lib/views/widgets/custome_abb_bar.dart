import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/cutome_search_button.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 35,
          ),
        ),
        CustomSearchButton(
          icon: const Icon(
            Icons.search,
            size: 32,
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}

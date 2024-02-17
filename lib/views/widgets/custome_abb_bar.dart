import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/cutome_search_button.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Notes",
          style: TextStyle(
            fontSize: 35,
          ),
        ),
        CustomSearchButton(),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: const Color.fromARGB(255, 59, 59, 59),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10.0),
        //     ),
        //   ),
        //   onPressed: () {},
        //   child: const Icon(
        //     Icons.search,
        //     size: 32,
        //     color: Colors.white,
        //   ),
        // ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custome_abb_bar.dart';
import 'package:notes_app/views/widgets/notes_list.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomeAppBar(
            title: "Notes",
            onTap: () {},
          ),
          const Expanded(
            child: NotesList(),
          ),
        ],
      ),
    );
  }
}

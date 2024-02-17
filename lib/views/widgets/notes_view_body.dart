import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custome_abb_bar.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CustomeAppBar(),
          NoteItem(),
        ],
      ),
    );
  }
}

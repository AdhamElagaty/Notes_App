import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: 5,
      itemBuilder: (context, index) => const NoteItem(),
    );
  }
}

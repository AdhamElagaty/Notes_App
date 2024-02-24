import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custome_abb_bar.dart';
import 'package:notes_app/views/widgets/edit_note_form.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 24.0,
        bottom: 24,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomeAppBar(
            title: "Edit Note",
            icon: const Icon(
              FontAwesomeIcons.xmark,
              color: Color.fromARGB(255, 255, 140, 132),
              size: 32,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          EditNoteForm(
            noteModel: noteModel,
          ),
        ],
      ),
    );
  }
}

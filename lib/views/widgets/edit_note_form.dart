import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custome_button.dart';
import 'package:notes_app/views/widgets/custome_text_field.dart';

class EditNoteForm extends StatefulWidget {
  const EditNoteForm({
    super.key,
    required this.noteModel,
  });

  static GlobalKey<FormState> formState = GlobalKey();
  final NoteModel noteModel;

  @override
  State<EditNoteForm> createState() => _EditNoteFormState();
}

class _EditNoteFormState extends State<EditNoteForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: EditNoteForm.formState,
      autovalidateMode: autovalidateMode,
      child: Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 16),
              child: CustomeTextField(
                hintText: "Write Here....",
                labelText: "Title",
                initialValue: widget.noteModel.title,
                maxLength: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomeTextField(
                hintText: "Write Here....",
                labelText: "Content",
                initialValue: widget.noteModel.subTitle,
                // width: 420,
                height: 500,
              ),
            ),
            CustomeButton(
              isLoading: false,
              textButton: "Update",
              onTap: () {},
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

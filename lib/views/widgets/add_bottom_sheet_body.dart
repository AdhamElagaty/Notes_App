import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';

class AddNoteBottomSheetBody extends StatelessWidget {
  const AddNoteBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 6,
        left: 12,
        right: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: const SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custome_abb_bar.dart';
import 'package:notes_app/views/widgets/custome_title_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomeAppBar(
              title: "Edit Note",
              icon: const Icon(
                Icons.check,
                size: 32,
              ),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16, top: 16),
              child: CustomeTitleTextField(
                hintText: "Write Here....",
                labelText: "Title",
                maxLength: 50,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: CustomeTitleTextField(
                hintText: "Write Here....",
                labelText: "Content",
                width: 420,
                height: 500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

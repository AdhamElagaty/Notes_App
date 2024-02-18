import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custome_button.dart';
import 'package:notes_app/views/widgets/custome_title_text_field.dart';

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                height: 200,
              ),
            ),
            CustomeButton(
              textButton: "Add",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

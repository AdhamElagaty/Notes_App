import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custome_button.dart';
import 'package:notes_app/views/widgets/custome_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16, top: 16),
            child: CustomeTextField(
              hintText: "Write Here....",
              labelText: "Title",
              maxLength: 50,
              onSaved: (value) {
                title = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CustomeTextField(
              hintText: "Write Here....",
              labelText: "Content",
              height: 200,
              onSaved: (value) {
                subTitle = value;
              },
            ),
          ),
          CustomeButton(
            textButton: "Add",
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}

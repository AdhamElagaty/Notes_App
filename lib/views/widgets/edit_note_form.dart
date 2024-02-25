import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
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
  bool isValidSubT = false, isValidT = false;
  String? subTitle, title;

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
                onChanged: (data) {
                  title = data;
                  checkTitleValidation();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomeTextField(
                hintText: "Write Here....",
                labelText: "Content",
                initialValue: widget.noteModel.subTitle,
                // width: 420,
                height: 400,
                onChanged: (data) {
                  subTitle = data;
                  checkSubTitleValidation();
                },
              ),
            ),
            AbsorbPointer(
              absorbing: isValidSubT || isValidT ? false : true,
              child: CustomeButton(
                isLoading: false,
                textButton: "Update",
                onTap: () {
                  updateNoteData();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
                color: isValidSubT || isValidT
                    ? const Color(kPrimaryColor)
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkSubTitleValidation() {
    if (subTitle != widget.noteModel.subTitle &&
        EditNoteForm.formState.currentState!.validate() &&
        !isValidSubT) {
      isValidSubT = true;
      setState(() {});
    } else if (subTitle == widget.noteModel.subTitle && isValidSubT) {
      isValidSubT = false;
      setState(() {});
    } else if (!EditNoteForm.formState.currentState!.validate()) {
      isValidSubT = false;
      setState(() {});
    }
  }

  void checkTitleValidation() {
    if (title != widget.noteModel.title &&
        EditNoteForm.formState.currentState!.validate() &&
        !isValidT) {
      isValidT = true;
      setState(() {});
    } else if (title == widget.noteModel.title && isValidT) {
      isValidT = false;
      setState(() {});
    } else if (!EditNoteForm.formState.currentState!.validate()) {
      isValidT = false;
      setState(() {});
    }
  }

  void updateNoteData() {
    widget.noteModel.title = title ?? widget.noteModel.title;
    widget.noteModel.subTitle = subTitle ?? widget.noteModel.subTitle;
    widget.noteModel.save();
  }
}

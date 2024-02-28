import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/add_color_list.dart';
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
  bool isValidT = false, isValidSupT = false;

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
              onChanged: (data) {
                checkTitleValidation(data);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CustomeTextField(
              hintText: "Write Here....",
              labelText: "Content",
              height: 300,
              onSaved: (value) {
                subTitle = value;
              },
              onChanged: (data) {
                checkSubTitleValidation(data);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 18, top: 6),
            child: AddColorList(),
          ),
          AbsorbPointer(
            absorbing: isValidSupT && isValidT ? false : true,
            child: BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomeButton(
                  isLoading: State is AddNoteLoading,
                  textButton: "Add",
                  color: isValidSupT && isValidT
                      ? const Color(kPrimaryColor)
                      : Colors.grey,
                  onTap: () {
                    addNote(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addNote(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var formattedDate = DateFormat("dd-M-yyyy").format(DateTime.now());
      NoteModel noteModel = NoteModel(
        title: title!,
        subTitle: subTitle!,
        date: formattedDate,
        color: Colors.blue.value,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void checkSubTitleValidation(String? data) {
    if (!(data?.isEmpty ?? true) && !isValidSupT) {
      isValidSupT = true;
      setState(() {});
    } else if ((data?.isEmpty ?? true) && isValidSupT) {
      isValidSupT = false;
      setState(() {});
    }
  }

  void checkTitleValidation(String? data) {
    if (!(data?.isEmpty ?? true) && !isValidT) {
      isValidT = true;
      setState(() {});
    } else if ((data?.isEmpty ?? true) && isValidT) {
      isValidT = false;
      setState(() {});
    }
  }
}

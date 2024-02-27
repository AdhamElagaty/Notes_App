import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custome_button.dart';
import 'package:notes_app/views/widgets/custome_text_field.dart';
import 'package:notes_app/views/widgets/edit_color_list.dart';

class EditNoteForm extends StatelessWidget {
  const EditNoteForm({
    super.key,
    required this.noteModel,
  });

  final AutovalidateMode autovalidateMode = AutovalidateMode.always;
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoteCubit(noteModel: noteModel),
      child: BlocConsumer<EditNoteCubit, EditNoteState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            key: BlocProvider.of<EditNoteCubit>(context).formState,
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
                      initialValue: noteModel.title,
                      maxLength: 50,
                      onChanged: (data) {
                        BlocProvider.of<EditNoteCubit>(context).title = data;
                        BlocProvider.of<EditNoteCubit>(context).isValidTitle();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CustomeTextField(
                      hintText: "Write Here....",
                      labelText: "Content",
                      initialValue: noteModel.subTitle,
                      // width: 420,
                      height: 400,
                      onChanged: (data) {
                        BlocProvider.of<EditNoteCubit>(context).subTitle = data;
                        BlocProvider.of<EditNoteCubit>(context)
                            .isValidSubTitle();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                    ),
                    child: EditColorList(
                      intialColor: noteModel.color,
                    ),
                  ),
                  AbsorbPointer(
                    absorbing:
                        BlocProvider.of<EditNoteCubit>(context).isValidT ||
                                BlocProvider.of<EditNoteCubit>(context)
                                    .isValidSubT ||
                                BlocProvider.of<EditNoteCubit>(context).isValidC
                            ? false
                            : true,
                    child: CustomeButton(
                      isLoading: false,
                      textButton: "Update",
                      onTap: () {
                        BlocProvider.of<EditNoteCubit>(context)
                            .updateNoteData();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        Navigator.pop(context);
                      },
                      color: BlocProvider.of<EditNoteCubit>(context).isValidT ||
                              BlocProvider.of<EditNoteCubit>(context)
                                  .isValidSubT ||
                              BlocProvider.of<EditNoteCubit>(context).isValidC
                          ? const Color(kPrimaryColor)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

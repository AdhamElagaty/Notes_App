import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';

class AddNoteBottomSheetBody extends StatelessWidget {
  const AddNoteBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          } else if (state is AddNoteFailure) {}
        },
        builder: (context, state) => AbsorbPointer(
          absorbing: state is AddNoteLoading,
          child: Padding(
            padding: EdgeInsets.only(
              top: 6,
              left: 12,
              right: 12,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: const SingleChildScrollView(
              child: AddNoteForm(),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesInitial) {
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        }
        List<NoteModel> noteModel =
            BlocProvider.of<NotesCubit>(context).noteModel ?? [];
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: noteModel.length,
          itemBuilder: (context, index) => NoteItem(
            noteModel: noteModel[index],
          ),
        );
      },
    );
  }
}

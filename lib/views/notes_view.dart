import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/add_bottom_sheet_body.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  static String id = "NotesView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
        ),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: const Color(kPrimaryColor),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => const AddNoteBottomSheetBody(),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
      body: const NotesViewBody(),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit({this.noteModel}) : super(EditNoteInitial());

  GlobalKey<FormState> formState = GlobalKey();

  NoteModel? noteModel;
  bool isValidT = false, isValidSubT = false, isValidC = false;
  String? subTitle, title;
  int? color;

  isValidTitle() {
    if (title != noteModel!.title &&
        formState.currentState!.validate() &&
        !isValidT) {
      isValidT = true;
      emit(EditNoteUpdateValidation());
    } else if (title == noteModel!.title && isValidT) {
      isValidT = false;
      emit(EditNoteUpdateValidation());
    } else if (!formState.currentState!.validate()) {
      isValidT = false;
      isValidSubT = false;
      emit(EditNoteUpdateValidation());
    }
  }

  isValidSubTitle() {
    if (subTitle != noteModel!.subTitle &&
        formState.currentState!.validate() &&
        !isValidSubT) {
      isValidSubT = true;
      emit(EditNoteUpdateValidation());
    } else if (subTitle == noteModel!.subTitle && isValidSubT) {
      isValidSubT = false;
      emit(EditNoteUpdateValidation());
    } else if (!formState.currentState!.validate()) {
      isValidSubT = false;
      isValidT = false;
      emit(EditNoteUpdateValidation());
    }
  }

  isValidColor() {
    if (color != noteModel!.color &&
        formState.currentState!.validate() &&
        !isValidC) {
      isValidC = true;
      emit(EditNoteUpdateValidation());
    } else if (color == noteModel!.color && isValidC) {
      isValidC = false;
      emit(EditNoteUpdateValidation());
    } else if (!formState.currentState!.validate()) {
      isValidC = false;
      isValidSubT = false;
      isValidT = false;
      emit(EditNoteUpdateValidation());
    }
  }

  void updateNoteData() {
    noteModel!.title = title ?? noteModel!.title;
    noteModel!.subTitle = subTitle ?? noteModel!.subTitle;
    noteModel!.color = color ?? noteModel!.color;
    noteModel!.save();
  }
}

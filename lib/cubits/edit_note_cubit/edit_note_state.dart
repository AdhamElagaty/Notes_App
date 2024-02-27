part of 'edit_note_cubit.dart';

@immutable
sealed class EditNoteState {}

final class EditNoteInitial extends EditNoteState {}

final class EditNoteUpdateValidation extends EditNoteState {}

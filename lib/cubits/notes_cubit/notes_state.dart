part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSuccess extends NotesState {
  final List<NoteModel> noteModel;

  NotesSuccess({required this.noteModel});
}

final class NotesFailuer extends NotesState {
  final String erorMessage;

  NotesFailuer({required this.erorMessage});
}

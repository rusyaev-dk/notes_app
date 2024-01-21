import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/database/hive_box.dart';
import 'package:notes_app/domain/database/notes_data.dart';
import 'package:notes_app/ui/routes/app_routes.dart';

class NoteProvider extends ChangeNotifier {
  // контроллеры
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  void controllersClear() {
    titleController.clear();
    textController.clear();
  }

  Future<void> addNote(BuildContext context) async {
    await HiveBox.notes
        .add(
          NotesData(
              title: titleController.text.isNotEmpty
                  ? titleController.text
                  : "Заметка",
              text: textController.text.isNotEmpty
                  ? textController.text
                  : "Текстик заметки"),
        )
        .then((value) => context.go(AppRoutes.home))
        .then((value) => controllersClear());
  }

  Future<void> deleteNote(BuildContext context, int index) async {
    await HiveBox.notes.deleteAt(index).then(
          (value) => Navigator.pop(context),
        );
  }

  Future<void> changeNote(BuildContext context, int index) async {
    await HiveBox.notes
        .putAt(
          index,
          NotesData(
            title: titleController.text,
            text: textController.text,
          ),
        )
        .then((value) => context.go(AppRoutes.home))
        .then((value) => controllersClear());
  }

  bool isTheme = false;

  void changeTheme(bool value) {
    isTheme = value;
    notifyListeners();
  }

  void changeLanguage(BuildContext context) {
    if (context.locale == const Locale('ru')) {
      context.setLocale(const Locale('en'));
    } else if (context.locale == const Locale('en')) {
      context.setLocale(const Locale('uz'));
    } else {
      context.setLocale(const Locale('ru'));
    }
    notifyListeners();
  }
}

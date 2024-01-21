import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/domain/database/notes_data.dart';
import 'package:notes_app/generated/codegen_loader.g.dart';

import 'notes_app.dart';

// https://habr.com/ru/companies/jugru/articles/446562/

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(NotesDataAdapter());
  await Hive.openBox<NotesData>('notes');

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
        Locale('uz'),
      ],
      path: "assets/translations",
      fallbackLocale: const Locale('ru'),
      assetLoader: const CodegenLoader(),
      child: const NotesApp(),
    ),
  );
}

// flutter packages pub run build_runner build --delete-conflicting-outputs

// flutter pub run easy_localization:generate -S "assets/translations"
// flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S "assets/translations"

// flutter build apk --release
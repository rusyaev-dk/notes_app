import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';

part 'notes_data.g.dart';

@HiveType(typeId: 0)
class NotesData {
  @HiveField(0)
  String title;

  @HiveField(1)
  String text;

  @HiveField(2)
  late String date;

  NotesData({
    required this.title,
    required this.text,
  }) {
    final DateTime dateTime = DateTime.now();
    date = DateFormat('dd.mm.yyyy').format(dateTime);
  }
}

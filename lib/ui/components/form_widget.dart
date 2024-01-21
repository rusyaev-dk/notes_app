import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/providers/note_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.btnName,
    required this.btnFunc,
  });

  final String btnName;
  final Function btnFunc;

  @override
  Widget build(BuildContext context) {
    final titleController = context.watch<NoteProvider>().titleController;
    final textController = context.watch<NoteProvider>().textController;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFieldWidget(
            controller: titleController,
            labelText: LocaleKeys.title.tr(),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFieldWidget(
            controller: textController,
            labelText: LocaleKeys.note.tr(),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: FloatingActionButton.extended(
              onPressed: () {
                btnFunc();
              },
              backgroundColor: AppColors.bgColor,
              label: Text(
                btnName,
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.purple,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.grey,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppStyle.fontStyle.copyWith(
          fontSize: 12,
          color: AppColors.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

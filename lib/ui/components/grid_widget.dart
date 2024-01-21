import 'package:flutter/material.dart';
import 'package:notes_app/ui/components/card_widget.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 150),
      itemBuilder: (context, i) {
        return CardWidget(
          index: i,
          title: 'Title',
          date: '04.12.2023',
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
        );
      },
      itemCount: 5,
    );
  }
}

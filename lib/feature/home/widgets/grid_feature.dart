import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final int index;

  const GridItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.featured_play_list,
          size: 50,
        ),
        Text(
          'Item $index',
        ),
      ],
    );
  }
}

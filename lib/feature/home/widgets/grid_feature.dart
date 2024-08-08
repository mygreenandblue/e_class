// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eclass/core/extensions/flutter_extentions.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String label;
  final Function() onTap;
  final IconData? iconData;

  const GridItem({
    Key? key,
    required this.label,
    required this.onTap,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            iconData ?? Icons.featured_play_list_outlined,
            size: 50,
          ),
          Text(
            label,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    ).padded(8);
  }
}

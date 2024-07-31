// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class MainFeatureItem extends StatelessWidget {
  const MainFeatureItem({
    Key? key,
    required this.color,
    required this.iconColor,
    required this.onTap,
    required this.label,
    required this.icons,
  }) : super(key: key);

  final Color color;
  final Color iconColor;
  final Function() onTap;
  final String label;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 100,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Icon(
                icons,
                size: 32,
                color: iconColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

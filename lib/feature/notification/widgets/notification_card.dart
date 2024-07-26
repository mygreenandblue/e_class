import 'package:eclass/core/extensions/flutter_extentions.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({super.key});

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Icon(Icons.check_outlined),
            SizedBox(
              width: 4,
            ),
            Text(
              '2:21',
              style: TextStyle(
                color: Colors.black12,
                fontSize: 14,
              ),
            ),
          ],
        ).paddedLTRB(16, 8, 16, 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 241, 240),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/logos/logo.png',
                height: 200,
              ),
              const SizedBox(height: 16),
              const Text(
                'NÂNG CAO TRẢI NGHIỆM KHÁCH HÀNG',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({super.key});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF001719),
            Color(0xFF1B807C),

            // Color(0xFF016D69),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Giáo viên chủ nhiệm',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Số điện thoại',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            Text(
              '9704 **** **** 9655',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ]),
          SizedBox(height: 8),
          Text(
            'Thẻ chính',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

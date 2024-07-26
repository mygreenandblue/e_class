import 'package:eclass/feature/notification/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thông báo'),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const NotificationCard();
            }),
      ),
    );
  }
}

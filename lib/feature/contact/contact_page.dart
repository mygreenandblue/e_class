import 'package:eclass/core/extensions/flutter_extentions.dart';
import 'package:eclass/feature/contact/widgets/contact_card.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Liên hệ'),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ContactCard().padded(8);
            }).padded(8),
      ),
    );
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'package:eclass/feature/remote_consult/view/patient_info_page.dart';
import 'package:eclass/feature/remote_consult/view/remote_booking_page.dart';
import 'package:flutter/material.dart';

class RemoteConsultPage extends StatefulWidget {
  const RemoteConsultPage({super.key});

  @override
  _RemoteConsultPageState createState() => _RemoteConsultPageState();
}

class _RemoteConsultPageState extends State<RemoteConsultPage> {
  final PageController _pageController = PageController();

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng ký tư vấn từ xa'),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          RemoteBookingPage(nextPage: _nextPage),
          const PatientInfoPage(),
        ],
      ),
    );
  }
}

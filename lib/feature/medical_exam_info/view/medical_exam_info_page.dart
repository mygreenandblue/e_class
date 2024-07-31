import 'package:flutter/material.dart';

class MedicalExamInfoPage extends StatefulWidget {
  const MedicalExamInfoPage({super.key});

  @override
  State<MedicalExamInfoPage> createState() => _MedicalExamInfoPageState();
}

class _MedicalExamInfoPageState extends State<MedicalExamInfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin khám'),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.history, color: Colors.teal),
              title: const Text('Lịch sử đặt hẹn'),
              subtitle: const Text('Các lịch đăng ký trước đây'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.teal),
              title: const Text('Lịch đang đăng ký'),
              subtitle: const Text('Các lịch đăng ký đang được xử lý'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.teal),
              title: const Text('Kết quả tư vấn từ xa'),
              subtitle: const Text('Kết quả từ các lần được tư vấn, khám bệnh'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.attach_money, color: Colors.teal),
              title: const Text('Lịch sử giao dịch'),
              subtitle:
                  const Text('Thông tin chi tiết các thanh toán đã thực hiện'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

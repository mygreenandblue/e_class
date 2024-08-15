import 'package:flutter/material.dart';

class AppointmentDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin đặt khám'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildInfoRow('Ngày khám', '02/03/2021'),
            buildInfoRow('Giờ khám dự kiến', '07:30 (Buổi sáng)',
                highlight: true),
            buildInfoRow('Bác sĩ', 'Hoàng Thị Bích Thủy'),
            buildInfoRow('Chuyên khoa', 'Nội Tim Mạch'),
            const Divider(height: 32, thickness: 2, color: Colors.teal),
            buildInfoRow('Bệnh nhân', 'Hồ Gia Phúc'),
            buildInfoRow('Năm sinh', '24/02/1994'),
            buildInfoRow('Giới tính', 'Nam'),
            buildInfoRow('Số điện thoại', '0587080907'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  // Add your onPressed logic here
                },
                child: Text(
                  'Đặt khám',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String value, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
              color: highlight ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

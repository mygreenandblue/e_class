import 'package:eclass/routing/app_routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin hồ sơ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.push(AppRouter.profileEditPath);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/logos/logo.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sử dụng Qrcode để khai báo thông tin hành chính tại các cơ sở y tế',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Divider(),
            buildInfoRow('Quan hệ', 'Bản thân'),
            buildInfoRow('Thẻ BHYT số', ''),
            buildInfoRow('Họ tên', 'ĐỖ ĐĂNG TÙNG'),
            buildInfoRow('Ngày sinh', '06/10/2002'),
            buildInfoRow('Giới tính', 'Nam'),
            buildInfoRow('Dân tộc', 'Kinh'),
            buildInfoRow('Quốc tịch', 'Việt Nam'),
            buildInfoRow('Nghề nghiệp', 'Sinh viên, học sinh'),
            buildInfoRow('Số điện thoại khác', ''),
            buildInfoRow('Số CMND/CCCD', ''),
            buildInfoRow('Địa chỉ thường trú',
                'Bình Yên, Thạch Thất, Xã Bình Yên, Huyện Thạch Thất, Thành phố Hà Nội'),
            buildInfoRow('Địa chỉ hiện tại',
                'Thạch Thất hà nooii, Xã Bình Yên, Huyện Thạch Thất, Thành phố Hà Nội'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Thông tin khám',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Hồ sơ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Cài đặt',
          ),
        ],
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

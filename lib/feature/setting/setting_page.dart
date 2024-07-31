import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person_rounded),
            ),
            title: Text('ĐỖ ĐĂNG TÙNG'),
            subtitle: Text('Đăng nhập gần đây: 11:53 SA, 31/07/2024'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Thay đổi mật khẩu'),
            onTap: () {
              // Handle password change
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Thay đổi số điện thoại'),
            onTap: () {
              // Handle phone number change
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Đăng xuất'),
            onTap: () {
              // Handle logout
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Xoá tài khoản'),
            onTap: () {
              // Handle account deletion
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Điều khoản sử dụng'),
            onTap: () {
              // Show terms of use
            },
          ),
        ],
      ),
    );
  }
}

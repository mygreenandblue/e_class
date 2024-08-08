// ignore_for_file: use_build_context_synchronously

import 'package:eclass/core/local/auth_local.dart';
import 'package:eclass/feature/login/cubit/auth_cubit.dart';
import 'package:eclass/routing/app_routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person_rounded),
            ),
            title: const Text('ĐỖ ĐĂNG TÙNG'),
            subtitle: const Text('Đăng nhập gần đây: 11:53 SA, 31/07/2024'),
            onTap: () => context.push(AppRouter.profilePath),
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
            onTap: () async {
              context.read<AuthCubit>().logout();
              final token = await AuthLocal.getAccessToken();
              if (token == null) {
                context.go(AppRouter.loginPath);
              }
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

import 'package:eclass/core/models/profile.dart';
import 'package:eclass/feature/profile/cubit/profile_cubit.dart';
import 'package:eclass/routing/app_routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Thông tin hồ sơ'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    Profile? updated = await context
                        .push(AppRouter.profileEditPath, extra: state.profile);
                    if (updated != null) {
                      context.read<ProfileCubit>().getProfile();
                    }
                  },
                ),
              ],
            ),
            body: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: QrImageView(
                            data:
                                'Quan hệ: Bản thân\nHọ tên: ${state.profile?.firstName ?? ''} ${state.profile?.lastName ?? ''}\nNgày sinh: ${state.profile?.dateOfBirth ?? ''}\nGiới tính: ${state.profile?.gender ?? ''}\nDân tộc: ${state.profile?.nationality ?? ''}\nQuốc tịch: ${state.profile?.nation ?? ''}\nNghề nghiệp: ${state.profile?.job ?? ''}\nSĐT: ${state.profile?.phoneNumber ?? ''}\nCMND/CCCD: ${state.profile?.cmnd ?? ''}\nĐịa chỉ: ${state.profile?.address ?? ''}',
                            version: QrVersions.auto,
                            size: 250,
                            gapless: false,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Sử dụng Qrcode để khai báo thông tin hành chính tại các cơ sở y tế',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        buildInfoRow('Quan hệ', 'Bản thân'),
                        // buildInfoRow('Thẻ BHYT số', ''),
                        buildInfoRow('Họ tên',
                            '${state.profile?.firstName ?? ''} ${state.profile?.lastName ?? ''}'),
                        buildInfoRow(
                            'Ngày sinh', state.profile?.dateOfBirth ?? ''),
                        buildInfoRow('Giới tính', state.profile?.gender ?? ''),
                        buildInfoRow(
                            'Dân tộc', state.profile?.nationality ?? ''),
                        buildInfoRow('Quốc tịch', state.profile?.nation ?? ''),
                        buildInfoRow('Nghề nghiệp', state.profile?.job ?? ''),
                        buildInfoRow(
                            'Số điện thoại', state.profile?.phoneNumber ?? ''),
                        buildInfoRow('Số CMND/CCCD', state.profile?.cmnd ?? ''),
                        buildInfoRow(
                            'Địa chỉ thường trú', state.profile?.address ?? ''),
                        buildInfoRow('Địa chỉ hiện tại',
                            state.profile?.currentAddress ?? ''),
                      ],
                    ),
                  ),
          );
        },
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

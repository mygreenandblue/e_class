// ignore_for_file: use_build_context_synchronously

import 'package:eclass/core/models/profile.dart';
import 'package:eclass/feature/profile/cubit/profile_cubit.dart';
import 'package:eclass/feature/profile/widgets/date_picker.dart';
import 'package:eclass/routing/app_routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController bhytController = TextEditingController();
    TextEditingController cmndController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    String selectedNation = 'Khác';
    String selectedNationality = 'Khác';
    String selectedJob = 'Khác';
    String selectedGender = 'Khác';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sửa thông tin hồ sơ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            const Text('Thông tin hành chính',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                labelText: 'Họ và tên đệm',
                hintText: 'Nhập họ và tên đệm',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: 'Tên',
                hintText: 'Nhập tên',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            CustomDatePicker(
                height: 80,
                width: MediaQuery.of(context).size.width,
                dateController: dateController,
                selectedDate: DateTime.now()),
            const SizedBox(height: 8),
            DropdownButtonFormField(
              value: selectedGender,
              items: ['Nam', 'Nữ', 'Khác']
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value ?? 'Khác';
                });
              },
              decoration: const InputDecoration(
                labelText: 'Giới tính',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                  hintText: 'Nhập địa chỉ thường trú',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                  suffixIcon: Icon(Icons.arrow_drop_down_outlined)),
              readOnly: true,
              onTap: () async {
                final address = await context.push(AppRouter.addressFormPath);
                if (address != null && address is String) {
                  addressController.text = address;
                }
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: bhytController,
              decoration: const InputDecoration(
                labelText: 'Thẻ BHYT số',
                hintText: 'Nhập số thẻ BHYT',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: cmndController,
              decoration: const InputDecoration(
                labelText: 'Số CMND/CCCD',
                hintText: 'Nhập số CMND/CCCD',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Thông tin khác',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField(
              value: selectedNation,
              items: ['Kinh', 'Khác']
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedNation = value ?? 'Khác';
                });
              },
              decoration: const InputDecoration(
                labelText: 'Dân tộc',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField(
              value: selectedNationality,
              items: ['Việt Nam', 'Khác']
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedNationality = value ?? 'Khác';
                });
              },
              decoration: const InputDecoration(
                labelText: 'Quốc tịch',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField(
              value: selectedJob,
              items: ['Sinh viên, học sinh', 'Khác']
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedJob = value ?? 'Khác';
                });
              },
              decoration: const InputDecoration(
                labelText: 'Nghề nghiệp',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Số điện thoại khác',
                hintText: 'Nhập số điện thoại khác',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                hintText: 'Nhập E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                Map<dynamic, dynamic> mergedJson = {};

                if (firstNameController.text.isNotEmpty) {
                  mergedJson['first_name'] = firstNameController.text;
                }
                if (lastNameController.text.isNotEmpty) {
                  mergedJson['last_name'] = lastNameController.text;
                }
                if (dateController.text.isNotEmpty) {
                  mergedJson['dateOf_birth'] = dateController.text;
                }

                if (bhytController.text.isNotEmpty) {
                  mergedJson['the_bhyt'] = bhytController.text;
                }
                mergedJson['gender'] = selectedGender;

                if (cmndController.text.isNotEmpty) {
                  mergedJson['cmnd'] = cmndController.text;
                }

                if (addressController.text.isNotEmpty) {
                  mergedJson['address'] = addressController.text;
                }

                mergedJson['nation'] = selectedNation;
                mergedJson['job'] = selectedJob;
                mergedJson['nationality'] = selectedNationality;

                if (phoneController.text.isNotEmpty) {
                  mergedJson['phone_number'] = phoneController.text;
                }

                if (emailController.text.isNotEmpty) {
                  mergedJson['email'] = emailController.text;
                }
                Map<String, dynamic> mergedJsonStringKeyed =
                    Map<String, dynamic>.from(mergedJson);
                await context
                    .read<ProfileCubit>()
                    .creaateProfile(Profile.fromJson(mergedJsonStringKeyed));

                // context.pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF00C4B4),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }
}

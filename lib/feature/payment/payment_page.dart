// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:eclass/core/extensions/day_of_week.dart';
import 'package:eclass/core/helpers/messange_helper.dart';
import 'package:eclass/core/local/auth_local.dart';
import 'package:eclass/core/local/image_local.dart';
import 'package:eclass/feature/payment/cubit/payment_cubit.dart';
import 'package:eclass/routing/app_routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:eclass/core/extensions/flutter_extentions.dart';
import 'package:eclass/core/models/booking_time.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    Key? key,
    required this.bookingDetail,
  }) : super(key: key);

  final BookingDetail bookingDetail;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final bd = widget.bookingDetail;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              'Hủy',
              style: TextStyle(color: Colors.teal, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thông tin đặt lịch',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.red),
                const SizedBox(width: 10),
                Text(
                  '${bd.valueDate.vietnameseFormattedDate}, ${bd.valueTime}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Họ và tên: ${bd.name}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ).padded(),
            const Text(
              'Bệnh viện: Bệnh viện y học cổ truyền',
              style: TextStyle(
                fontSize: 16,
              ),
            ).padded(),
            Text(
              'Dịch vụ khám: ${bd.medicalService}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ).padded(),
            const Text(
              'Phòng khám: Phòng khám bệnh',
              style: TextStyle(
                fontSize: 16,
              ),
            ).padded(),
            const SizedBox(height: 20),
            const Text(
              'Thông tin thanh toán',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              bd.medicalService,
              style: const TextStyle(
                fontSize: 16,
              ),
            ).padded(),
            Row(
              children: [
                const Text(
                  'Mã khuyến mãi:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Chọn mã',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationThickness: 0.5,
                        decorationColor: Colors.teal),
                  ),
                ),
              ],
            ).padded(),
            const Text(
              'Tổng phí: 0 đ',
              style: TextStyle(
                fontSize: 16,
              ),
            ).padded(),
            const SizedBox(height: 10),
            const Divider(),
            RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(
                text: 'Bằng xác nhận, bạn đã đồng ý với ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                  color: Color(0xFF8A8D8E), // Color for the first part
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'chính sách thanh toán và hoàn trả phí',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Colors.teal, // Different color for the second part
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng cộng',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '0 đ',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            BlocProvider(
              create: (context) => PaymentCubit(),
              child: BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () async {
                      final List<File> files = await getSavedImages();
                      final fileName = files.first;
                      final userId = await AuthLocal.getUserId();
                      if (userId != null) {
                        final isSuccess = await context
                            .read<PaymentCubit>()
                            .payment(
                                userId,
                                bd.keyIdDoctor,
                                bd.symptomText,
                                bd.valueDate,
                                bd.valueTime,
                                bd.medicalService,
                                fileName.path);
                        if (isSuccess) {
                          showSnackBar(context, 'Đặt lịch thành công!');
                          context.go(AppRouter.homePath);
                        } else {
                          showSnackBar(
                              context, 'Đã có lỗi xảy ra, vui lòng thử lại!');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: state.isLoading
                        ? const CircularProgressIndicator()
                        : const Text(
                            'Xác nhận',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

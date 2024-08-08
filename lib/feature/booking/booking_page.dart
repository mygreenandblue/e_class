import 'package:eclass/routing/app_routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String? selectedCSYT;
  String? selectedDoiTuong = 'Viện phí'; // Default selected value
  String? selectedDichVuKham;
  String? selectedPhongKham;
  String? selectedBacSi;
  String? selectedThoiGianDenKham;
  TextEditingController ghiChuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt lịch khám tại cơ sở y tế'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Thông tin cá nhân',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextFormField(
                initialValue: 'ĐỖ ĐĂNG TÙNG',
                decoration: const InputDecoration(
                  labelText: 'Hồ sơ',
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Thông tin CSYT',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: selectedCSYT,
                items: const [
                  DropdownMenuItem(value: 'CSYT 1', child: Text('CSYT 1')),
                  DropdownMenuItem(value: 'CSYT 2', child: Text('CSYT 2')),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCSYT = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Nơi khám',
                ),
              ),
              const SizedBox(height: 20),
              const Text('Đối tượng',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              RadioListTile<String>(
                title: const Text('BHYT'),
                value: 'BHYT',
                groupValue: selectedDoiTuong,
                onChanged: (value) {
                  setState(() {
                    selectedDoiTuong = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Viện phí'),
                value: 'Viện phí',
                groupValue: selectedDoiTuong,
                onChanged: (value) {
                  setState(() {
                    selectedDoiTuong = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedDichVuKham,
                items: const [
                  DropdownMenuItem(
                      value: 'Dịch vụ 1', child: Text('Dịch vụ 1')),
                  DropdownMenuItem(
                      value: 'Dịch vụ 2', child: Text('Dịch vụ 2')),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedDichVuKham = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Dịch vụ khám',
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedPhongKham,
                items: const [
                  DropdownMenuItem(
                      value: 'Phòng khám 1', child: Text('Phòng khám 1')),
                  DropdownMenuItem(
                      value: 'Phòng khám 2', child: Text('Phòng khám 2')),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedPhongKham = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Phòng khám',
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedBacSi,
                items: const [
                  DropdownMenuItem(value: 'Bác sĩ 1', child: Text('Bác sĩ 1')),
                  DropdownMenuItem(value: 'Bác sĩ 2', child: Text('Bác sĩ 2')),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedBacSi = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Bác sĩ',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                readOnly: true,
                onTap: () {
                  context.push(AppRouter.bookingCalendar);
                },
                decoration: const InputDecoration(
                  labelText: 'Thời gian đến khám',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Ghi chú (Triệu chứng)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: ghiChuController,
                    maxLength: 400,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'Nhập ghi chú (Triệu chứng)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle file attachment
                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Ảnh đính kèm'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Đính kèm giấy hẹn khám, giấy chuyển viện, ... nếu có',
                      style:
                          TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the continue action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Tiếp tục'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

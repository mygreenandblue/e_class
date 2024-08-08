// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:flutter/material.dart';

class RemoteBookingPage extends StatefulWidget {
  final VoidCallback nextPage;

  const RemoteBookingPage({
    Key? key,
    required this.nextPage,
  }) : super(key: key);

  @override
  _RemoteBookingPageState createState() => _RemoteBookingPageState();
}

class _RemoteBookingPageState extends State<RemoteBookingPage> {
  String? _selectedDoctor;
  DateTime? _selectedDate;
  final TextEditingController _contentController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          DropdownButtonFormField<String>(
            value: _selectedDoctor,
            hint: const Text('Chọn bác sĩ'),
            items: ['Doctor A', 'Doctor B', 'Doctor C']
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedDoctor = value;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            readOnly: true,
            onTap: () => _selectDate(context),
            decoration: InputDecoration(
              labelText: 'Ngày đăng ký *',
              hintText: _selectedDate == null
                  ? 'Chọn thời gian đăng ký'
                  : _selectedDate.toString(),
              suffixIcon: const Icon(Icons.calendar_today),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _contentController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Nội dung khám',
              hintText: 'Nội dung khám',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Thêm ảnh'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: widget.nextPage,
            child: const Text('Tiếp tục'),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PatientInfoPage extends StatefulWidget {
  const PatientInfoPage({super.key});

  @override
  _PatientInfoPageState createState() => _PatientInfoPageState();
}

class _PatientInfoPageState extends State<PatientInfoPage> {
  String? _selectedLocation;
  String? _selectedService;
  String? _selectedClinic;
  String? _selectedDoctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          const Text('Thông tin cá nhân'),
          TextFormField(
            readOnly: true,
            initialValue: 'ĐỖ ĐẶNG TÙNG',
            decoration: const InputDecoration(
              labelText: 'Hồ sơ *',
            ),
          ),
          const SizedBox(height: 16),
          const Text('Thông tin hẹn khám'),
          DropdownButtonFormField<String>(
            value: _selectedLocation,
            hint: const Text('Chọn nơi khám'),
            items: ['Location A', 'Location B', 'Location C']
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedLocation = value;
              });
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedService,
            hint: const Text('Chọn dịch vụ khám'),
            items: ['Service A', 'Service B', 'Service C']
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedService = value;
              });
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedClinic,
            hint: const Text('Chọn phòng khám'),
            items: ['Clinic A', 'Clinic B', 'Clinic C']
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedClinic = value;
              });
            },
          ),
          const SizedBox(height: 16),
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
          ElevatedButton(
            onPressed: () {
              // Handle the form submission or further actions
            },
            child: const Text('Tiếp tục'),
          ),
        ],
      ),
    );
  }
}

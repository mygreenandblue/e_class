// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eclass/core/extensions/flutter_extentions.dart';
import 'package:flutter/material.dart';

import 'package:eclass/feature/booking_calendar/widgets/calendar.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'widgets/time_slot.dart';

class BookingCalendarPage extends StatefulWidget {
  const BookingCalendarPage({
    Key? key,
    required this.doctorId,
  }) : super(key: key);
  final int doctorId;

  @override
  State<BookingCalendarPage> createState() => _BookingCalendarPageState();
}

class _BookingCalendarPageState extends State<BookingCalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  String? selectedTime; // Variable to store the selected time

  void _handleTimeSelected(String? time) {
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chọn thời gian khám"),
      ),
      body: Column(
        children: [
          CalendarWidget(
            selectedDay: _selectedDay,
            focusedDay: _focusedDay,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          Expanded(
            child: TimeSlotsGrid(
                doctorId: widget.doctorId,
                date: DateFormat('yyyy-MM-dd').format(_focusedDay).toString(),
                onTimeSelected: _handleTimeSelected),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal, // Button color
              minimumSize: const Size(double.infinity, 50), // Full-width button
            ),
            onPressed: () {
              Map<String, dynamic> data = {
                'time': selectedTime,
                'date': DateFormat('yyyy-MM-dd').format(_selectedDay).toString()
              };

              context.pop(data);
            },
            child: const Text(
              "Tiếp tục",
              style: TextStyle(color: Colors.white),
            ),
          ).padded(),
        ],
      ),
    );
  }
}

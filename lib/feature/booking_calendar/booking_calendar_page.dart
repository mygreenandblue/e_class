import 'package:eclass/feature/booking_calendar/widgets/calendar.dart';
import 'package:flutter/material.dart';

import 'widgets/time_slot.dart';

class BookingCalendarPage extends StatefulWidget {
  const BookingCalendarPage({super.key});

  @override
  State<BookingCalendarPage> createState() => _BookingCalendarPageState();
}

class _BookingCalendarPageState extends State<BookingCalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Số chỗ còn trống: 55",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Expanded(
            child: TimeSlotsGrid(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Button color
                minimumSize:
                    const Size(double.infinity, 50), // Full-width button
              ),
              onPressed: () {
                // Handle continue button press
              },
              child: const Text(
                "Tiếp tục",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

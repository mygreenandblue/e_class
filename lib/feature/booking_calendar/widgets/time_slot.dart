import 'package:flutter/material.dart';

class TimeSlotsGrid extends StatelessWidget {
  static final List<String> timeSlots = [
    "07:20",
    "08:00",
    "08:10",
    "08:20",
    "08:30",
    "08:40",
    "08:50",
    "09:00",
    "09:10"
  ];

  const TimeSlotsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      padding: const EdgeInsets.all(16.0),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white, // Text color
          ),
          onPressed: () {
            // Handle time slot selection
          },
          child: Text(timeSlots[index]),
        );
      },
    );
  }
}

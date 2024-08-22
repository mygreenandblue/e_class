import 'package:eclass/core/extensions/flutter_extentions.dart';
import 'package:eclass/feature/booking_calendar/cubit/booking_calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSlotsGrid extends StatefulWidget {
  final int doctorId;
  final String date;
  final ValueChanged<String?> onTimeSelected;
  const TimeSlotsGrid(
      {super.key,
      required this.doctorId,
      required this.date,
      required this.onTimeSelected});

  @override
  State<TimeSlotsGrid> createState() => _TimeSlotsGridState();
}

class _TimeSlotsGridState extends State<TimeSlotsGrid> {
  int? selectedItem;
  String? time;

  @override
  Widget build(BuildContext context) {
    int slots = 0;
    return BlocProvider(
      create: (context) =>
          BookingCalendarCubit()..findAll(widget.doctorId, widget.date),
      child: BlocBuilder<BookingCalendarCubit, BookingCalendarState>(
        builder: (context, state) {
          if (state is BookingCalendarInitial) {
            return const Text('!');
          } else if (state is BookingCalendarLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            slots = state.bookingTimes
                .where((item) => item.status == 'False')
                .length;
            return Column(
              children: [
                Text(
                  'Số chỗ còn trống:  $slots',
                  style: const TextStyle(fontSize: 18),
                ).padded(),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    padding: const EdgeInsets.all(16.0),
                    itemCount: state.bookingTimes.length,
                    itemBuilder: (context, index) {
                      final bt = state.bookingTimes[index];
                      return MaterialButton(
                        focusColor: Colors.black,
                        color: bt.status == 'True'
                            ? const Color(0xFFBBBBBB)
                            : selectedItem == index
                                ? Colors.teal
                                : Colors.white, // Text color
                        onPressed: () {
                          if (bt.status == 'False') {
                            setState(() {
                              selectedItem = index;
                              time = bt.time;
                              widget.onTimeSelected.call(time);
                            });
                          }
                        },
                        child: Text(
                          state.bookingTimes[index].time.toString(),
                          style: TextStyle(
                              color:
                                  selectedItem == index ? Colors.white : null),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is BookingCalendarError) {
            return const Text('!');
          }
          return Container();
        },
      ),
    );
  }
}

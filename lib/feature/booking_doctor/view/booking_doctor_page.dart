import 'package:eclass/core/extensions/flutter_extentions.dart';
import 'package:eclass/core/widgets/custom_search_field.dart';
import 'package:eclass/feature/booking_doctor/cubit/booking_doctor_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eclass/routing/app_routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookingDoctorPage extends StatefulWidget {
  const BookingDoctorPage({super.key});

  @override
  State<BookingDoctorPage> createState() => _BookingDoctorPageState();
}

class _BookingDoctorPageState extends State<BookingDoctorPage> {
  int? id;
  int? selectedItem;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn bác sĩ'),
      ),
      body: Column(
        children: [
          const CustomSearchField(
            hintText: 'Tìm bác sĩ',
          ).padded(8.0),
          Expanded(
            child: BlocProvider(
              create: (context) => BookingDoctorCubit()..findAllDoctors(),
              child: BlocBuilder<BookingDoctorCubit, BookingDoctorState>(
                builder: (context, state) {
                  return state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: state.doctors!.length,
                          itemBuilder: (context, index) {
                            final doctor = state.doctors![index];
                            return Card(
                              color: selectedItem == index
                                  ? const Color(0xFF8DD3CB)
                                  : null,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                onTap: () =>
                                    context.push(AppRouter.doctorDetail),
                                leading: SizedBox(
                                  width: 64,
                                  height: 64,
                                  child: CachedNetworkImage(
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                      child: CircularProgressIndicator(
                                        value: progress.progress,
                                      ),
                                    ),
                                    imageUrl: doctor.image ?? '',
                                  ),
                                ),
                                title: Text(
                                  '${doctor.firstName} ${doctor.firstName}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.favorite,
                                            color: Colors.pink, size: 16),
                                        const SizedBox(width: 4),
                                        Text('5'),
                                        const SizedBox(width: 8),
                                        const Icon(Icons.star,
                                            color: Colors.yellow, size: 16),
                                        const SizedBox(width: 4),
                                        Text('5'),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      doctor.specialization ?? '',
                                      style:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                                trailing: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedItem = index;
                                      id = doctor.id;
                                      name =
                                          '${doctor.firstName} ${doctor.lastName}';
                                    });
                                  },
                                  color: Colors.teal,
                                  textColor: Colors.white,
                                  child: const Text('Chọn bác sĩ'),
                                ),
                              ),
                            ).padded(8.0);
                          },
                        );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final Map<String, dynamic> data = {'id': id, 'name': name};
          context.pop(data);
        },
        label: const Text(
          'Xác nhận',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

class Doctor {
  final String name;
  final int rating;
  final int stars;
  final String specialty;
  final String imageUrl;

  Doctor({
    required this.name,
    required this.rating,
    required this.stars,
    required this.specialty,
    required this.imageUrl,
  });
}

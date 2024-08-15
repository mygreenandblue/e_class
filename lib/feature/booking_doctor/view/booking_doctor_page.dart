import 'package:eclass/core/extensions/flutter_extentions.dart';
import 'package:eclass/core/widgets/custom_search_field.dart';
import 'package:eclass/feature/home/view/home_page.dart';
import 'package:eclass/routing/app_routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookingDoctorPage extends StatefulWidget {
  const BookingDoctorPage({super.key});

  @override
  State<BookingDoctorPage> createState() => _BookingDoctorPageState();
}

class _BookingDoctorPageState extends State<BookingDoctorPage> {
  final List<Doctor> doctors = [
    Doctor(
      name: "GS Lê Ngọc Thành",
      rating: 93,
      stars: 5,
      specialty: "Ngoại tim mạch",
      imageUrl: "assets/doctor1.png", // Placeholder for doctor images
    ),
    Doctor(
      name: "TS.BS Nguyễn Công Hựu",
      rating: 165,
      stars: 5,
      specialty: "Ngoại tim mạch",
      imageUrl: "assets/doctor2.png", // Placeholder for doctor images
    ),
    Doctor(
      name: "TS.BS Nguyễn Đình Liên",
      rating: 293,
      stars: 5,
      specialty: "Phẫu thuật thận tiết niệu - nam học",
      imageUrl: "assets/doctor3.png", // Placeholder for doctor images
    ),
    Doctor(
      name: "TS.BS Nguyễn Đình Liên",
      rating: 293,
      stars: 5,
      specialty: "Phẫu thuật thận tiết niệu - nam học",
      imageUrl: "assets/doctor3.png", // Placeholder for doctor images
    ),
    Doctor(
      name: "TS.BS Nguyễn Đình Liên",
      rating: 293,
      stars: 5,
      specialty: "Phẫu thuật thận tiết niệu - nam học",
      imageUrl: "assets/doctor3.png", // Placeholder for doctor images
    ),
    Doctor(
      name: "TS.BS Nguyễn Đình Liên",
      rating: 293,
      stars: 5,
      specialty: "Phẫu thuật thận tiết niệu - nam học",
      imageUrl: "assets/doctor3.png", // Placeholder for doctor images
    ),
    Doctor(
      name: "TS.BS Nguyễn Đình Liên",
      rating: 293,
      stars: 5,
      specialty: "Phẫu thuật thận tiết niệu - nam học",
      imageUrl: "assets/doctor3.png", // Placeholder for doctor images
    ),
    Doctor(
      name: "TS.BS Nguyễn Đình Liên",
      rating: 293,
      stars: 5,
      specialty: "Phẫu thuật thận tiết niệu - nam học",
      imageUrl: "assets/doctor3.png", // Placeholder for doctor images
    ),
    Doctor(
      name: "TS.BS Nguyễn Đình Liên",
      rating: 293,
      stars: 5,
      specialty: "Phẫu thuật thận tiết niệu - nam học",
      imageUrl: "assets/doctor3.png", // Placeholder for doctor images
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn bác sĩ'),
      ),
      body: Column(
        children: [
          CustomSearchField(
            hintText: 'Tìm bác sĩ',
          ).padded(8.0),
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    onTap: () => context.push(AppRouter.doctorDetail),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(doctor.imageUrl),
                      radius: 30,
                    ),
                    title: Text(
                      doctor.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.pink, size: 16),
                            SizedBox(width: 4),
                            Text(doctor.rating.toString()),
                            SizedBox(width: 8),
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            SizedBox(width: 4),
                            Text(doctor.stars.toString()),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          doctor.specialty,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ).padded(8.0);
              },
            ),
          ),
        ],
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

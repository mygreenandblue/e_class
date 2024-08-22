import 'dart:io';

import 'package:eclass/core/extensions/day_of_week.dart';
import 'package:eclass/core/extensions/flutter_extentions.dart';
import 'package:eclass/core/local/image_local.dart';
import 'package:eclass/core/models/booking_time.dart';
import 'package:eclass/feature/booking/widgets/upload_image.dart';
import 'package:eclass/feature/home/cubit/home_cubit.dart';
import 'package:eclass/routing/app_routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String? selectedCSYT;
  String? selectedDoiTuong = 'Viện phí'; // Default selected value
  String? selectedDichVuKham = 'Khám bệnh';
  String? selectedPhongKham;
  String? selectedBacSi;
  String? selectedThoiGianDenKham;
  TextEditingController symptomTextController = TextEditingController();
  TextEditingController doctorController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  String? selectedImageFile;
  final String? initialValue = '';
  int? idDoctor;
  bool enable = false;
  String? time;
  String? date;
  String? name;
  final _formKey = GlobalKey<FormState>();

  List<File> _selectedImageFiles = [];

  @override
  void initState() {
    _loadSavedImages();
    super.initState();
  }

  Future<void> _loadSavedImages() async {
    _selectedImageFiles = await getSavedImages();
    setState(() {});
  }

  void _onImageSelected(String? path, File? image) async {
    setState(() {
      selectedImageFile = path ?? '';
      _selectedImageFiles.add(image!);
    });
    await saveImagePaths(_selectedImageFiles);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt lịch khám tại cơ sở y tế'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Thông tin cá nhân',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                BlocProvider(
                  create: (context) => HomeCubit()..getUser(),
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeInitial) {
                        return const Text('!');
                      } else if (state is HomeLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is Loaded) {
                        name =
                            '${state.userModel.firstName} ${state.userModel.lastName}';

                        return TextFormField(
                          initialValue:
                              '${state.userModel.firstName} ${state.userModel.lastName}',
                          decoration: const InputDecoration(
                            labelText: 'Hồ sơ',
                            suffixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Không được để trống';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {
                            if (!FocusScope.of(context).hasFocus) {
                              _formKey.currentState?.validate();
                            }
                          },
                        );
                      } else if (state is HomeError) {
                        return const Text('!');
                      }
                      return Container();
                    },
                  ),
                ),
                // const SizedBox(height: 20),
                // const Text('Thông tin CSYT',
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                // DropdownButtonFormField<String>(
                //   value: selectedCSYT,
                //   items: const [
                //     DropdownMenuItem(value: 'CSYT 1', child: Text('CSYT 1')),
                //     DropdownMenuItem(value: 'CSYT 2', child: Text('CSYT 2')),
                //   ],
                //   onChanged: (value) {
                //     setState(() {
                //       selectedCSYT = value;
                //     });
                //   },
                //   decoration: const InputDecoration(
                //     labelText: 'Nơi khám',
                //   ),
                // ),
                // const SizedBox(height: 20),
                // const Text('Đối tượng',
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                // RadioListTile<String>(
                //   title: const Text('BHYT'),
                //   value: 'BHYT',
                //   groupValue: selectedDoiTuong,
                //   onChanged: (value) {
                //     setState(() {
                //       selectedDoiTuong = value;
                //     });
                //   },
                // ),
                // RadioListTile<String>(
                //   title: const Text('Viện phí'),
                //   value: 'Viện phí',
                //   groupValue: selectedDoiTuong,
                //   onChanged: (value) {
                //     setState(() {
                //       selectedDoiTuong = value;
                //     });
                //   },
                // ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: selectedDichVuKham,
                  items: const [
                    DropdownMenuItem(
                        value: 'Khám bệnh', child: Text('Khám bệnh')),
                    // DropdownMenuItem(
                    //     value: 'Dịch vụ 2', child: Text('Dịch vụ 2')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedDichVuKham = value;
                    });
                    if (!FocusScope.of(context).hasFocus) {
                      _formKey.currentState?.validate();
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Dịch vụ khám',
                  ),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Không được để trống';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),

                const SizedBox(height: 20),
                TextFormField(
                  readOnly: true,
                  controller: doctorController,
                  onTap: () async {
                    final data = await context.push(AppRouter.bookingDoctor);
                    if (data != null) {
                      Map<String, dynamic> doctor =
                          data as Map<String, dynamic>;
                      if (doctor['id'] != null) {
                        doctorController.text = doctor['name'].toString();
                        idDoctor = doctor['id'];
                        enable = true;
                        if (idDoctor != doctor['id']) {
                          timeController.clear();
                        }
                        setState(() {});
                      }
                    }
                  },
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Không được để trống';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    if (!FocusScope.of(context).hasFocus) {
                      _formKey.currentState?.validate();
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Chọn bác sĩ',
                    suffixIcon: Icon(Icons.person_add_outlined),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  enabled: enable,
                  readOnly: true,
                  controller: timeController,
                  onTap: () async {
                    final data = await context.pushNamed('bookingCalendar',
                        pathParameters: {'doctorId': idDoctor.toString()});
                    if (data != null) {
                      Map<String, dynamic> bookingTime =
                          data as Map<String, dynamic>;
                      if (bookingTime['time'] != null &&
                          bookingTime['date'] != null) {
                        setState(() {
                          time = bookingTime['time'];
                          date = bookingTime['date'];
                          timeController.text =
                              '${date!.vietnameseFormattedDate}, $time';
                        });
                      }
                    }
                  },
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Không được để trống';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    if (!FocusScope.of(context).hasFocus) {
                      _formKey.currentState?.validate();
                    }
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      controller: symptomTextController,
                      maxLength: 400,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Nhập ghi chú (Triệu chứng)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    UploadImage(onImageSelected: _onImageSelected),
                    const Text(
                      'Đính kèm giấy hẹn khám, giấy chuyển viện, ... nếu có',
                      style:
                          TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                    ),
                    if (_selectedImageFiles.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _selectedImageFiles.map((file) {
                          return Image.file(
                            file,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ).padded(16);
                        }).toList(),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          BookingDetail extra = BookingDetail(
                              valueDate: date!,
                              valueTime: time!,
                              keyIdDoctor: idDoctor!,
                              medicalService: selectedDichVuKham!,
                              symptomText: symptomTextController.text,
                              name: name!);
                          context.push(AppRouter.payment, extra: extra);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Text(
                        'Tiếp tục',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

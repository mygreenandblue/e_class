// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eclass/feature/address_form/cubit/address_cubit.dart';
import 'package:go_router/go_router.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({Key? key}) : super(key: key);

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  String? selectedProvince;
  String? selectedDistrict;
  String? selectedWard;
  List<Map<String, dynamic>> wards = [];
  List<Map<String, dynamic>> districts = [];
  List<Map<String, dynamic>> provinces = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AddressCubit>().fetchProvinces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Địa chỉ chi tiết'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            wards = state.wards;
            districts = state.districts;
            provinces = state.provinces;

            return buildForm(
                context, state.provinces, state.districts, state.wards);
          },
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context, List<Map<String, dynamic>> provinces,
      List<Map<String, dynamic>> districts, List<Map<String, dynamic>> wards) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: 'Tỉnh/Thành phố'),
          value: selectedProvince,
          items: provinces.map<DropdownMenuItem<String>>((province) {
            return DropdownMenuItem<String>(
              value: province['province_id'].toString(),
              child: Text(province['province_name']),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedProvince = value;
              selectedDistrict = null;
              selectedWard = null;
            });
            if (value != null) {
              context.read<AddressCubit>().fetchDistricts(value);
            }
          },
        ),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: 'Quận/Huyện'),
          value: selectedDistrict,
          items: districts.map<DropdownMenuItem<String>>((district) {
            return DropdownMenuItem<String>(
              value: district['district_id'].toString(),
              child: Text(district['district_name']),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedDistrict = value;
              selectedWard = null;
            });
            if (value != null) {
              context.read<AddressCubit>().fetchWards(value);
            }
          },
        ),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: 'Phường/Xã'),
          value: selectedWard,
          items: wards.map<DropdownMenuItem<String>>((ward) {
            return DropdownMenuItem<String>(
              value: ward['ward_id'].toString(),
              child: Text(ward['ward_name']),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedWard = value;
            });
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Địa chỉ chi tiết'),
          controller: controller,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            String wardName =
                getNameById(wards, 'ward_id', 'ward_name', selectedWard ?? '');
            String districtName = getNameById(districts, 'district_id',
                'district_name', selectedDistrict ?? '');
            String provinceName = getNameById(provinces, 'province_id',
                'province_name', selectedProvince ?? '');
            final address =
                '${controller.text}, $wardName, $districtName, $provinceName';

            context.pop(address);
          },
          child: const Text('Lưu'),
        ),
      ],
    );
  }

  String getNameById(List<Map<String, dynamic>> items, String idKey,
      String nameKey, String id) {
    for (var item in items) {
      if (item[idKey] == id) {
        return item[nameKey];
      }
    }
    return '';
  }
}

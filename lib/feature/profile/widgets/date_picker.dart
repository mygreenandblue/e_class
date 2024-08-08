// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, library_private_types_in_public_api, avoid_print
import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  CustomDatePicker({
    super.key,
    required this.dateController,
    required this.selectedDate,
    this.height,
    this.width,
    this.borderColor,
  });
  TextEditingController dateController;

  DateTime selectedDate;
  final double? height, width;
  final Color? borderColor;
  @override
  State<CustomDatePicker> createState() => CustomDatePickerState();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  bool hasFocus = false;
  late FocusNode focusNode;

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: widget.dateController,
      readOnly: true,
      onTap: () async {
        final DateTime? dateTime = await showDatePicker(
          context: context,
          initialDate: widget.selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(3000),
        );
        if (dateTime != null) {
          setState(() {
            widget.selectedDate = dateTime;
            widget.dateController.text =
                '${widget.selectedDate.year}-${widget.selectedDate.month}-${widget.selectedDate.day}';
          });
        }
      },
      decoration: const InputDecoration(
        hintText: 'Chọn ngày sinh',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_month_outlined),
      ),
    );
  }
}

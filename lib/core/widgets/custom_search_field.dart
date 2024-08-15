// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    Key? key,
    this.onTap,
    this.hintText,
  }) : super(key: key);

  final Function(void)? onTap;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => onTap,
      decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 40,
            height: 30,
            child: Center(
              child: Icon(
                Icons.search_outlined,
                color: Colors.grey.shade300,
              ),
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.grey)),
          contentPadding: const EdgeInsets.all(4)),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:task/src/utils/styles.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      required this.hint,
      required this.icon,
      required this.controller});
  final String hint;
  final IconData icon;
  final TextEditingController controller;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String? checkFieldEmpty(String fieldContent) {
    if (fieldContent.trim().isEmpty) {
      return 'Please enter ${widget.hint}';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: (10)),
      child: SizedBox(
        child: TextFormField(
          validator: (value) => checkFieldEmpty(value ?? ''),
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25.0),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Icon(
                widget.icon,
                color: Colors.grey,
              ),
            ),
            filled: true,
            hintStyle: Styles.styleWhite
                .copyWith(color: Colors.grey, fontSize: 12.spMin),
            hintText: widget.hint,
            fillColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}

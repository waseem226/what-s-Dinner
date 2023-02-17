import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintName;
  final void Function(String)? onChanged;
  final String? Function(String?)? validationField;
  final TextEditingController? fieldController;
  final Widget? suffix;
  final bool? readOnly;
  final TextStyle? hintstyle;

  const CustomTextField(
      {super.key,
      required this.hintName,
      this.onChanged,
      this.validationField,
      this.fieldController,
      this.suffix,
      this.readOnly,
      this.hintstyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(2)),
      child: Center(
        child: TextFormField(
          controller: fieldController,
          readOnly: readOnly ?? false,
          validator: validationField,
          onChanged: onChanged,
          decoration: InputDecoration(
              suffixIcon: suffix,
              suffixIconColor: Colors.black,
              filled: true,
              fillColor: AppColors.textFieldColor,
              border: InputBorder.none,
              hintText: hintName,
              hintStyle: hintstyle ?? TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }
}

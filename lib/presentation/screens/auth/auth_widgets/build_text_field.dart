import 'package:be_fit/core/constants/color_extension.dart';
import 'package:be_fit/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? suffWidget;
  final Widget? preWidget;
  final String? Function(String?)? validator;
  final Function(void)? submitField;

  const BuildTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.controller,
    this.focusNode,
    this.preWidget,
    this.suffWidget,
    this.validator,
    this.submitField
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUnfocus,
      style: AppTextStyles.body1,
      focusNode: focusNode,
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      onFieldSubmitted: submitField,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.h),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(4.0),
          child: preWidget,
        ),
        
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: suffWidget,
        ),
        labelText: label,
        labelStyle: AppTextStyles.body1,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.neutralColorMediumGray),
        ),
      ),
    );
  }
}

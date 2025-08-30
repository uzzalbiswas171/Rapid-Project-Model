import 'package:flutter/material.dart';
import 'package:rapid_super_market/Core/Const/color_const.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final double height;
  final double borderRadius;

  const CustomEmailField({
    super.key,
    required this.controller,
    this.labelText = 'Email Address',
    this.height = 40.0,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black.withValues(alpha: 0.5),fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: ColorConst.baseColor.withValues(alpha: 0.7), width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}

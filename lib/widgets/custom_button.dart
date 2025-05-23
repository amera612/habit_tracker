import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, this.onTap});
  final String label;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryClr,
        ),
        child: Center(
          child: Text(label, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

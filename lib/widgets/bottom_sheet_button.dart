import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant.dart';

class BottomSheetButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color clr;
  final bool isClose;

  const BottomSheetButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.clr,
    this.isClose = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color:
                isClose
                    ? (Get.isDarkMode ? Colors.grey[600]! : Colors.grey[300]!)
                    : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style:
                isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

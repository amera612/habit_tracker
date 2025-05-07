import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/core/constant.dart';

class AddDataSection extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChange;
  final DateTime? initialDate;

  const AddDataSection({
    super.key,
    required this.selectedDate,
    required this.onDateChange,
    this.initialDate,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime startDate = initialDate ?? DateTime.now();

    return Container(
      height: 110,
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        startDate,
        height: 110,
        width: 90,
        initialSelectedDate: selectedDate,
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        onDateChange: onDateChange,
      ),
    );
  }
}

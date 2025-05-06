import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color urgentClr = Color(0xFFE57373);

const Color greenClr = Color(0xFF4CAF50); // إنجاز / إنتاجية
// const Color skyBlueClr = Color(0xFF03A9F4); // راحة / تأمل
// const Color amberClr = Color(0xFFFFC107);
//   // مهم وعاجل
// const Color moderateClr = Color(0xFFFFF176);  // مهم لكن مش عاجل
// const Color postponedClr = Color(0xFF9E9E9E); // ممكن يتأجل

const Color white = Colors.white;

const Color primaryClr = bluishClr;

const Color darkGreyClr = Color(0xFF121212);

const Color darkHeaderClr = Color(0xFF424242);

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[900],
    ),
  );
}

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/services/theme_service.dart';
import 'package:habit_tracker/widgets/add_task_section.dart';
import 'package:habit_tracker/widgets/custom_app_bar.dart';

import '../core/constant.dart';

// import '../services/notifcation.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final NotificationService notificationService = NotificationService();
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    // notificationService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          leadingIcon: Icons.nightlight_rounded,
          onLeadingPressed: () async {
            ThemeService().switchTheme();
            // await NotificationService().showNotification(
            //   "Theme Changed",
            //   "The app theme has been updated.",
            // );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddTask(),
            Container(
              height: 110,

              margin: const EdgeInsets.only(top: 20, left: 20),
              child: DatePicker(
                DateTime.now(),
                height: 110,
                width: 90,
                initialSelectedDate: DateTime.now(),
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
                onDateChange: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

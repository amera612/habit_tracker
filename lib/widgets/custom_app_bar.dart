import 'package:flutter/material.dart';

// import '../services/notifcation.service.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.leadingIcon,
    required this.onLeadingPressed,
  });
  final IconData leadingIcon;
  final VoidCallback onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          leadingIcon,
          size: 20,
          // color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
        onPressed: onLeadingPressed,
      ),
      actions: [
        CircleAvatar(backgroundImage: AssetImage("assets/images/pooo.jpg")),

        // IconButton(icon: const Icon(Icons.person, size: 20), onPressed: () {}),
        SizedBox(width: 20),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'home_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final box = GetStorage();

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/habits.png",
      "title": "Track Your Habits",
      "desc": "Stay consistent and improve your daily habits.",
    },
    {
      "image": "assets/images/range.png",
      "title": "Build Better Routines",
      "desc": "Organize your tasks and routines easily.",
    },
    {
      "image": "assets/images/goal.png",
      "title": "Achieve More",
      "desc": "Set goals and achieve them step by step.",
    },
  ];

  void finishOnboarding() {
    box.write("isFirstTime", false);
    Get.offAll(() => const HomeView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(onboardingData[index]["image"]!, height: 300),
                  const SizedBox(height: 30),
                  Text(
                    onboardingData[index]["title"]!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    onboardingData[index]["desc"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      if (index == onboardingData.length - 1) {
                        finishOnboarding();
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(
                      index == onboardingData.length - 1
                          ? "Get Started"
                          : "Next",
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

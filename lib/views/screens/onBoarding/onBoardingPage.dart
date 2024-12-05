import 'package:flutter/material.dart';
import 'onBoardingData.dart';
import '/views/widgets/onBoarding.dart';
import '/views/themes/styles/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0;

  void _onNext() {
    if (_currentIndex < onboardingItems.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            // Onboarding content
            Expanded(
              child: OnboardingWidget(item: onboardingItems[_currentIndex]),
            ),
            // Dot indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onboardingItems.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(7.0),
                  width: _currentIndex == index ? 12.0 : 8.0,
                  height: _currentIndex == index ? 12.0 : 8.0,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? darkOrangeColor : veryLightOrangeColor,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            // "Next" button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: _onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightOrangeColor, // Button background color
                  foregroundColor: whiteColor, // Button text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 140.0),
                ),
                child: Text(
                  _currentIndex == onboardingItems.length - 1 ? 'GET STARTED' : 'NEXT',
                  style: const TextStyle(
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10), // Space between "Next" and "Skip"
            // "Skip" button
            if (_currentIndex < onboardingItems.length - 1)
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontFamily: 'Sen',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: darkGrayColor,
                  ),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

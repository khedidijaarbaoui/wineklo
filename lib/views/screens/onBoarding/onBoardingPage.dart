import 'package:flutter/material.dart';
import 'onBoardingData.dart';
import '/views/widgets/onBoarding.dart';
import '/views/themes/styles/styles.dart';
import '/views/themes/styles/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

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
            Expanded(
              child: OnboardingWidget(item: onboardingItems[_currentIndex]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onboardingItems.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  width: _currentIndex == index ? 12.0 : 8.0,
                  height: _currentIndex == index ? 12.0 : 8.0,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? darkOrangeColor : lightGrayColor,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: _onNext,
                style: primaryButtonStyle,
                child: Text(
                  _currentIndex == onboardingItems.length - 1 ? 'Get Started' : 'Next',
                ),
              ),
            ),
            if (_currentIndex < onboardingItems.length - 1)
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('Skip'),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

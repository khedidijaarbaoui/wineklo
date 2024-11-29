import 'package:flutter/material.dart';
import 'package:wineklo/views/themes/styles/styles.dart';
import 'package:wineklo/views/themes/styles/colors.dart';
import '/views/screens/onBoarding/onBoardingData.dart';

class OnboardingWidget extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            item.imagePath,
            width: 240,
            height: 292,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        // Title
        Text(
          item.title,
          style: headlineStyle.copyWith(color: blackColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        // Subtitle with consistent margin
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            item.subtitle,
            style: bodyTextStyle.copyWith(color: darkGrayColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

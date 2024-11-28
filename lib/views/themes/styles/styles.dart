import 'package:flutter/material.dart';
import 'colors.dart';

// **Text Styles**
const TextStyle headlineStyle = TextStyle(
  fontFamily: 'Sen',
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: blackColor,
);

const TextStyle subheadingStyle = TextStyle(
  fontFamily: 'Sen',
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
  color: darkOrangeColor,
);

const TextStyle bodyTextStyle = TextStyle(
  fontFamily: 'Sen',
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
  color: darkGrayColor,
);

const TextStyle placeholderTextStyle = TextStyle(
  fontFamily: 'Sen',
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  color: textLightGrayColor,
);

const TextStyle buttonTextStyle = TextStyle(
  fontFamily: 'Sen',
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
  color: whiteColor,
);

// **Button Styles**
final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  textStyle: buttonTextStyle,
  backgroundColor: darkOrangeColor, // Background color
  foregroundColor: whiteColor, // Text color
  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
);

final ButtonStyle secondaryButtonStyle = OutlinedButton.styleFrom(
  textStyle: buttonTextStyle.copyWith(color: darkOrangeColor),
  side: const BorderSide(color: darkOrangeColor, width: 1.5),
  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
);

// **Box Decorations**
const BoxDecoration cardDecoration = BoxDecoration(
  color: whiteColor,
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
  boxShadow: [
    BoxShadow(
      color: lightGrayColor,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const BoxDecoration placeholderDecoration = BoxDecoration(
  color: lightGrayColor,
  borderRadius: BorderRadius.all(Radius.circular(4.0)),
);

// **Padding**
const EdgeInsets defaultPadding = EdgeInsets.all(16.0);
const EdgeInsets smallPadding = EdgeInsets.all(8.0);
const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 16.0);
const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 12.0);

// **Divider**
const Divider defaultDivider = Divider(
  thickness: 1.0,
  color: lightGrayColor,
);

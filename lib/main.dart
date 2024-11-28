import 'package:flutter/material.dart';
import 'views/themes/styles/theme.dart';
import 'commons/config.dart';
import '/views/screens/onBoarding/onBoardingPage.dart';
import '/views/screens/homescreen/HomeScreen.dart';
import '/views/screens/onBoarding/AnimatedSplash.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await my_init_app();  // Initialize app setup if any
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: THEME_DATA,
      initialRoute: '/',
      routes: {
        '/': (context) => const AnimatedSplashScreen(),
        '/onboarding': (context) => const OnboardingPage(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

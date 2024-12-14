import 'package:business_card_app/screens/bottomNavBar.dart';
import 'package:business_card_app/screens/chat_detail_screen.dart';
import 'package:business_card_app/screens/chooseLanguage.dart';
import 'package:business_card_app/screens/confirmationScreen.dart';
import 'package:business_card_app/screens/loginScreen.dart';
import 'package:business_card_app/screens/notification_screen.dart';
import 'package:business_card_app/screens/onBoardingScreen.dart';
import 'package:business_card_app/screens/otpVerification.dart';
import 'package:business_card_app/screens/qr_screen.dart';
import 'package:business_card_app/screens/registrationScreen.dart';
import 'package:flutter/material.dart';

import 'utils/constants/colors.dart';
import 'utils/constants/sizes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0, // Flat button style
            foregroundColor: TColors.textWhite, // Text color
            backgroundColor: Colors.black, // Background color (black)
            disabledForegroundColor: TColors.darkGrey, // Disabled text color
            disabledBackgroundColor:
                TColors.buttonDisabled, // Disabled background
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.buttonHeight,
              horizontal: TSizes.buttonWidth, // Add consistent padding
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              color: TColors.textWhite, // Ensure text remains white
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(TSizes.buttonRadius), // Rounded corners
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            elevation: 0, // No shadow
            foregroundColor: TColors.black, // Text color
            side: const BorderSide(color: Colors.black, width: 1), // Border
            textStyle: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.buttonHeight,
              horizontal: 20, // Button padding
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(TSizes.buttonRadius), // Rounded corners
            ),
          ),
        ),
        textTheme: TextTheme(
          headlineLarge: const TextStyle().copyWith(
              fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.dark),
          bodyLarge: const TextStyle().copyWith(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500),
        ),
      ),
      initialRoute: "/onboarding",
      routes: {
        '/onboarding': (context) => const Onboardingscreen(),
        '/chosseLanguage': (context) => const ChooseLanguage(),
        '/registration': (context) => const RegistrationScreen(),
        '/login': (context) => const Loginscreen(),
        '/otp': (context) => const OtpScreen(),
        '/confirmation': (context) => const ConfirmationScreen(),
        '/bottomNavBar': (context) => const BottomNavBarScreen(),
        '/qrScan': (context) => const QRShareScreen(),
        '/inbox': (context) => InboxScreen(),
        '/chatScreen': (context) => ChatDetailScreen(),
        '/notification': (context) => NotificationScreen(),
      },
    );
  }
}

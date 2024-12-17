import 'package:flutter/material.dart';

class OnBoardingFirst extends StatelessWidget {
  const OnBoardingFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add Image
                SizedBox(
                  child: Image.asset(
                    "assets/onboard.png",
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 30),

                // Title Text
                const Text(
                  "Welcome To Your Digital\nBusiness Card!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                // Subtitle Text
                const Text(
                  "Share Your Contact Details Instantly With\nJust A Tap Or Scan.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                // Continue Button
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/onboarding"),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: Center(
                          child: Text(
                            "Continue Courses",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(500)),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

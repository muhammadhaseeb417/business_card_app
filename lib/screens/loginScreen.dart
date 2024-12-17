import 'package:business_card_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/reusableTextFormField.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.only(left: 7),
            decoration: BoxDecoration(
              border: Border.all(
                  color: TColors.greyCustomColor), // Custom border color
              borderRadius:
                  BorderRadius.circular(8), // Optional: Add rounded corners
            ),
            alignment:
                Alignment.center, // Center the child within the container
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "LogIn",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              // Subtitle
              const Text(
                "Please Enter your details to continue",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              // Email Field
              ReusableTextFormField(
                labelText: "Email",
                hintText: "example@gmail.com",
                obscureText: false,
              ),
              const SizedBox(height: 20),
              // Password Field
              ReusableTextFormField(
                labelText: "Create a password",
                hintText: "must be 8 characters",
                obscureText: true,
              ),
              const SizedBox(height: 10),
              // Terms and Privacy Policy
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  const Text(
                    "I accept the terms and privacy policy",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Register Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/otp");
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // OR Sign Up Section
              const Center(child: Text("Or Sign Up With")),
              const SizedBox(height: 10),
              // Social Media Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon("assets/google.png"),
                  const SizedBox(width: 15),
                  _buildSocialIcon("assets/apple.png"),
                  const SizedBox(width: 15),
                  _buildSocialIcon("assets/mail.png"),
                  const SizedBox(width: 15),
                  _buildSocialIcon("assets/phone.png"),
                ],
              ),
              const SizedBox(height: 20),
              // Log In Link
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/registration");
                },
                child: const Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Don’t have an Account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Create Account",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Social Media Icon Widget
  Widget _buildSocialIcon(String assetPath) {
    return Image.asset(
      assetPath,
      height: 40,
      width: 40,
      fit: BoxFit.contain,
    );
  }
}

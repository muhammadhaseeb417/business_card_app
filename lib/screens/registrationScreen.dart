import 'package:flutter/material.dart';

import '../widgets/reusableTextFormField.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Arrow
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 28),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              // Title
              const Text(
                "Sign up",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              // Subtitle
              const Text(
                "Please enter your details to continue",
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
              const SizedBox(height: 20),
              // Confirm Password Field
              ReusableTextFormField(
                labelText: "Confirm password",
                hintText: "repeat password",
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
                    "Register",
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
                  Navigator.pushNamed(context, "/login");
                },
                child: const Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Log in",
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

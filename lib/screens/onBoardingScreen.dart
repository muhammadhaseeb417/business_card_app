import 'package:flutter/material.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 20,
            children: [
              SizedBox(
                height: 400,
              ),
              Text("Explore the app",
                  style: Theme.of(context).textTheme.headlineLarge),
              Text("Control your crow from one place ",
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 40),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: Theme.of(context)
                          .elevatedButtonTheme
                          .style!
                          .copyWith(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFFC55536)),
                          ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/chosseLanguage");
                      },
                      child: Text("Login"))),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/chosseLanguage");
                      },
                      child: Text("Register"))),
            ],
          ),
        ),
      ),
    );
  }
}

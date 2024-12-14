import 'package:flutter/material.dart';

import '../widgets/roundedReusableTextField.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for each field
    final fullNameController = TextEditingController();
    final companyNameController = TextEditingController();
    final phoneController = TextEditingController();
    final jobTitleController = TextEditingController();
    final linkController = TextEditingController();
    final paymentMethodController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Social',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none, // Allows overflowing widgets
              children: [
                Image.asset(
                  "assets/cover.png",
                  width: double.infinity, // Ensures image spans the width
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: -50, // Moves the avatar below the image
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const SizedBox(height: 20),
            // Toggle Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Lead",
                  style: TextStyle(fontSize: 16),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeTrackColor: Color(0xFFC55536),
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.black26,
                  ),
                ),
                const Text(
                  "Personal",
                  style: TextStyle(fontSize: 16),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeTrackColor: Color(0xFFC55536),
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.black26,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Form Fields
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Roundedreusabletextfield(
                    labelText: 'Full Name',
                    controller: fullNameController,
                  ),
                  Roundedreusabletextfield(
                    labelText: 'Company Name',
                    controller: companyNameController,
                  ),
                  Roundedreusabletextfield(
                    labelText: 'Phone',
                    controller: phoneController,
                  ),
                  Roundedreusabletextfield(
                    labelText: 'Job Title',
                    controller: jobTitleController,
                  ),
                  Roundedreusabletextfield(
                    labelText: 'Link',
                    controller: linkController,
                  ),
                  Roundedreusabletextfield(
                    labelText: 'Add Payment Method',
                    controller: paymentMethodController,
                  ),
                ],
              ),
            ),
            // Save Button
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/bottomNavBar", // The route you want to navigate to
                      (route) =>
                          false, // This condition removes all previous routes
                    );
                  },
                  child: const Text('Save'),
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

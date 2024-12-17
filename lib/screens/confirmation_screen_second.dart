import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

class ConfirmationScreenSecond extends StatelessWidget {
  const ConfirmationScreenSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/bottomNavBar", // The route you want to navigate to
              (route) => false, // This condition removes all previous routes
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'Social',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(
                border: Border.all(
                    color: TColors.greyCustomColor), // Custom border color
                borderRadius:
                    BorderRadius.circular(8), // Optional: Add rounded corners
              ),
              alignment:
                  Alignment.center, // Center the child within the container
              child: Image.asset("assets/share.png", height: 18),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Background Image and Profile Picture
            Stack(
              clipBehavior: Clip.none, // Allows overlapping elements
              children: [
                Image.asset(
                  "assets/cover.png", // Background image
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.orange, // Background color
                      shape: BoxShape.circle, // Makes the container circular
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/person.png'), // Replace with your image path
                        fit: BoxFit.contain, // Adjust image inside the circle
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50), // Space for avatar

            // Profile Type & Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Private",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Transform.scale(
                  scale: 0.6,
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
            const SizedBox(height: 5),
            const Text(
              "Kristin Watson",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Message Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center align content
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                      ),
                      child: const Text(
                        "Message",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                      width: 10), // Space between button and scan icon
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFFC55536),
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: const Icon(
                      Icons.qr_code_scanner, // Scan icon
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Profile Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildDetailRow("Company Name", "MHK Soul"),
                  _buildDetailRow("Phone", "(201) 555-0124"),
                  _buildDetailRow("Job Title", "Marketing Coordinator"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Add Payments Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Add payments",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(300),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(500),
                                    border: Border.all(color: Colors.grey)),
                                child: Icon(Icons.credit_card,
                                    color: Colors.black)),
                            SizedBox(width: 10),
                            Text(
                              "Credit Card",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Image.asset("assets/payment.png", height: 34),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Profile Details
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void showBasicPopup(BuildContext context, String? paid, String? sub) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Adjusts size based on children
          children: [
            // Image at the top
            Image.asset(
              'assets/tick.png', // Replace with your image asset path
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 25),

            // Title (Centered)
            Text(
              paid! == "" ? "Request Sent" : paid,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),

            // Message
            Text(
              sub! == "" ? "Your Request has been successfully\n Sent." : sub,
              textAlign: TextAlign.center, // Center-align text
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the pop-up
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      );
    },
  );
}

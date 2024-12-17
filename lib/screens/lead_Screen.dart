import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../widgets/search_bar_custom.dart';
import '../widgets/show_basic_popup.dart';

class LeadScreen extends StatelessWidget {
  const LeadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Lead',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchBarCustom(),
          const SizedBox(height: 10),

          // Leads List
          Expanded(
            child: ListView(
              children: [
                LeadCard(
                  name: 'John Doe',
                  role: 'Marketing Manager',
                  distance: '3.2 KM',
                  status: 'Connect',
                  profileImage: 'assets/profile1.png',
                ),
                LeadCard(
                  name: 'Ronald Richards',
                  role: 'Marketing Manager',
                  distance: '4.2 KM',
                  status: 'Connect',
                  profileImage: 'assets/profile2.png',
                ),
                LeadCard(
                  name: 'John Doe',
                  role: 'Marketing Manager',
                  distance: '3.2 KM',
                  status: 'Connect',
                  profileImage: 'assets/profile1.png',
                ),
                LeadCard(
                  name: 'Ronald Richards',
                  role: 'Marketing Manager',
                  distance: '4.2 KM',
                  status: 'Connect',
                  profileImage: 'assets/profile2.png',
                ),
                LeadCard(
                  name: 'John Doe',
                  role: 'Marketing Manager',
                  distance: '3.2 KM',
                  status: 'Connect',
                  profileImage: 'assets/profile1.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LeadCard extends StatelessWidget {
  final String name;
  final String role;
  final String distance;
  final String status;
  final String profileImage;

  const LeadCard({
    super.key,
    required this.name,
    required this.role,
    required this.distance,
    required this.status,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(profileImage),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          role,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: SizedBox(
          width: 100, // Ensures consistent width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => showSendReqBasicPopup(context),
                child: Container(
                  height: 20,
                  width: 60,
                  decoration: BoxDecoration(
                      color: status == 'Connect' ? Colors.black : Colors.red,
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Text(
                      status,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_pin, size: 16, color: Colors.red),
                  Text(
                    distance,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSendReqBasicPopup(BuildContext context) {
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
              const Text(
                "Request Connection",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Emily Carter has a private profile.\nSend a connection request?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          actions: [
            // Cancel Button
            SizedBox(
              width: double.infinity, // Takes full width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the pop-up
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 10), // Adds spacing between buttons

            // Send Request Button
            SizedBox(
              width: double.infinity, // Takes full width
              child: ElevatedButton(
                onPressed: () {
                  showBasicPopup(context, "", ""); // Perform next action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC55536),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  "Send Request",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

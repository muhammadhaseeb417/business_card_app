import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
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
            Navigator.pop(context);
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none, // Allows overflowing widgets
              children: [
                Image.asset(
                  "assets/coverb.png",
                  fit: BoxFit.contain,
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: 20,
                    bottom: 0,
                    child: Center(
                        child: SizedBox(
                      height: 53, // Set the desired height
                      width: 53, // Set the desired width
                      child: Image.asset(
                        "assets/addBackImg.png",
                        fit: BoxFit.contain, // Keeps aspect ratio
                      ),
                    ))),
                Positioned(
                  bottom: -50, // Moves the avatar below the image
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileStatusDropdownWithTextField(),
                  Roundedreusabletextfield(
                    labelText: 'Full Name',
                    controller: fullNameController,
                    fieldLabel: 'Kristin Watson',
                  ),
                  Roundedreusabletextfield(
                    labelText: 'Company Name',
                    controller: companyNameController,
                    fieldLabel: 'Mhk',
                  ),
                  Roundedreusabletextfield(
                    labelText: 'Phone',
                    controller: phoneController,
                    fieldLabel: '(207)555-0119',
                  ),
                  Roundedreusabletextfield(
                    labelText: 'Job Title',
                    controller: jobTitleController,
                    fieldLabel: 'Marketing Coordinator',
                  ),
                  Roundedreusabletextfield(
                    labelText: 'Link',
                    controller: linkController,
                    fieldLabel: 'Marketing Coordinator',
                  ),
                  Text(
                    "Add Payment Method",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                      "/confirmation2", // The route you want to navigate to
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

// Profile Status Dropdown + TextField Combo Widget
class ProfileStatusDropdownWithTextField extends StatefulWidget {
  const ProfileStatusDropdownWithTextField({super.key});

  @override
  State<ProfileStatusDropdownWithTextField> createState() =>
      _ProfileStatusDropdownWithTextFieldState();
}

class _ProfileStatusDropdownWithTextFieldState
    extends State<ProfileStatusDropdownWithTextField> {
  String dropdownValue = 'Hidden'; // Default dropdown value
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown for Profile Status
        Text(
          'Profile Status',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: TColors.greyCustomColor, width: 1.5),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon:
                  Icon(Icons.arrow_drop_down, color: TColors.orangeCustomColor),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Hidden', 'Private', 'Public', 'Lead']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(height: 16),
        // Rounded Reusable Text Field for Full Name
        Roundedreusabletextfield(
          labelText: 'Full Name',
          fieldLabel: dropdownValue, // Dynamic label based on dropdown
          controller: _nameController,
        ),
      ],
    );
  }
}

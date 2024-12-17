import 'package:business_card_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  final List<Map<String, dynamic>> languages = [
    {"flag": "🇬🇧", "name": "English"},
    {"flag": "🇮🇹", "name": "Italian"},
    {"flag": "🇨🇳", "name": "Chinese"},
    {"flag": "🇫🇷", "name": "French"},
    {"flag": "🇩🇪", "name": "German"},
    {"flag": "🇪🇸", "name": "Spanish"},
    {"flag": "🇷🇺", "name": "Russian"},
  ];

  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Choose the language",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Don't worry! It happens. Please enter the email associated with your account.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // Search Box
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Language List
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  return ListTile(
                    leading: Text(
                      language["flag"],
                      style: const TextStyle(fontSize: 20),
                    ),
                    title: Text(
                      language["name"],
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: selectedLanguage == language["name"]
                        ? const Icon(Icons.check_circle, color: Colors.orange)
                        : null,
                    onTap: () {
                      setState(() {
                        selectedLanguage = language["name"];
                      });
                    },
                  );
                },
              ),
            ),
            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/registration");
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
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

import 'package:flutter/material.dart';

class QRShareScreen extends StatefulWidget {
  const QRShareScreen({super.key});

  @override
  State<QRShareScreen> createState() => _QRShareScreenState();
}

class _QRShareScreenState extends State<QRShareScreen> {
  // Dropdown value for the social platform
  String selectedPlatform = 'Instagram';
  final List<String> platforms = [
    'Instagram',
    'Facebook',
    'Twitter',
    'WhatsApp'
  ];

  bool offlineMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          !offlineMode ? 'Share' : "Offline Mode",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Scan QR Code',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: [
                    const Text(
                      'Offline Mode',
                      style: TextStyle(fontSize: 16),
                    ),
                    Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: offlineMode,
                        onChanged: (value) {
                          setState(() {
                            offlineMode = !offlineMode;
                          });
                        },
                        activeTrackColor: Color(0xFFC55536),
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // QR Code
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFC55536), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.qr_code, size: 200, color: Colors.black),
            ),
            const SizedBox(height: 20),
            // Download Link
            TextFormField(
              initialValue: 'http://192.168.20.250:5000/',
              decoration: InputDecoration(
                labelText: 'Download Link',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFC55536),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.copy, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Dropdown for platform selection
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedPlatform,
                underline: const SizedBox(),
                items: platforms.map((String platform) {
                  return DropdownMenuItem(
                    value: platform,
                    child: Row(
                      children: [
                        const Icon(Icons.share, color: Colors.black),
                        const SizedBox(width: 10),
                        Text(platform),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPlatform = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            // Download Button
            !offlineMode
                ? SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Handle download action
                      },
                      child: const Text(
                        'Download',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

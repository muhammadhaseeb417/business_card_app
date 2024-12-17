import 'package:business_card_app/utils/constants/colors.dart';
import 'package:business_card_app/widgets/roundedReusableTextField.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
        title: Text(
          offlineMode ? 'Online' : "Offline Mode",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                      Text(
                        offlineMode ? "Online Mode" : 'Offline Mode',
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
                height: 200,
                width: 200,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFC55536), width: 2),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("assets/qrcode.png"),
                        fit: BoxFit.contain)),
              ),
              const SizedBox(height: 30),
              // Download Link
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Download Link",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Roundedreusabletextfield(
                        fieldLabel: "http://192.168.20.250:5000/"),
                  ),
                  SizedBox(width: 15),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(300),
                            border: Border.all(
                              color: TColors.greyCustomColor,
                            )),
                        child: Image.asset("assets/solar_copy.png", height: 24),
                      ),
                      SizedBox(width: 10),
                      !offlineMode
                          ? Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(300),
                                  border: Border.all(
                                    color: TColors.greyCustomColor,
                                  )),
                              child: Icon(
                                Icons.share,
                                color: TColors.orangeCustomColor,
                              ))
                          : SizedBox(),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(300),
                    border: Border.all(
                      color: TColors.greyCustomColor,
                    )),
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
                          child: Image.asset("assets/gmail.png", height: 17),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Generate Email Signature",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.share),
                    // Image.asset("assets/payment.png", height: 34),
                  ],
                ),
              ),
              SizedBox(height: 20),
              offlineMode
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(300),
                          border: Border.all(
                            color: TColors.greyCustomColor,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/profile1.png", height: 40),
                              SizedBox(width: 10),
                              Text(
                                "Generate Email Signature",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          // Icon(Icons.share),
                          Image.asset("assets/payment.png", height: 30),
                        ],
                      ),
                    )
                  : SizedBox(),

              !offlineMode
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(300),
                          border: Border.all(
                            color: TColors.greyCustomColor,
                          )),
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
                                child: Image.asset("assets/wallet.png",
                                    height: 17),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Encodes a Digital VCard",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.share),
                          // Image.asset("assets/payment.png", height: 34),
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              !offlineMode
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Inactive Profile",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w800),
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: 20),

              offlineMode
                  ? ElevatedButton(onPressed: () {}, child: Text("Download"))
                  : SizedBox(),
              !offlineMode
                  ? ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Order NFC Card",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ))
                  : SizedBox(),
              SizedBox(height: 15),
              !offlineMode
                  ? ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Activate Profile",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ))
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

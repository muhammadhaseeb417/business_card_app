import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int selectedMethod = 1; // For managing the selected payment method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button and header
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Payment Method Selection Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Select Payment Method",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10),

            // Payment Methods
            paymentMethodTile(1, 'assets/visa_logo.png', 'Visa xxx 3390 · 771'),
            paymentMethodTile(2, 'assets/paypal_logo.png', 'Paypal'),
            paymentMethodTile(3, 'assets/stripe_logo.png', 'Stripe'),

            SizedBox(height: 20),

            // Amount Summary
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  amountRow("Amount", "\$0.00"),
                  SizedBox(height: 10),
                  amountRow("VAT", "\$0.00"),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  amountRow("Total Amount", "\$0.00", isBold: true),
                ],
              ),
            ),

            Spacer(),

            // Pay Now Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for payment method tile
  Widget paymentMethodTile(int id, String logoPath, String title) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMethod = id;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selectedMethod == id ? Colors.orange : Colors.grey.shade300,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Radio(
              value: id,
              groupValue: selectedMethod,
              activeColor: Colors.orange,
              onChanged: (value) {
                setState(() {
                  selectedMethod = value as int;
                });
              },
            ),
            Image.asset(
              logoPath,
              height: 30,
              width: 50,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for amount row
  Widget amountRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

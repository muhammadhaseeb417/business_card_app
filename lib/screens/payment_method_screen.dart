import 'package:business_card_app/widgets/show_basic_popup.dart';
import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.only(left: 7),
            decoration: BoxDecoration(
              border: Border.all(color: TColors.greyCustomColor),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
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
          "Payment Method",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Section Title
            const Text(
              "Select Payment Method",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            // Payment Methods List
            _buildPaymentOption(
              logo: 'assets/visa.png', // Replace with the Visa card asset
              title: 'Visa xxx',
              subtitle: '3391 . 771',
              isSelected: true,
            ),
            const SizedBox(height: 12),
            _buildPaymentOption(
              logo: 'assets/paypal.png', // Replace with the PayPal asset
              title: 'Paypal',
              isSelected: false,
            ),
            const SizedBox(height: 12),
            _buildPaymentOption(
              logo: 'assets/stripe.png', // Replace with the Stripe asset
              title: 'Stripe',
              isSelected: false,
            ),
            Spacer(),
            // Payment Details
            _buildAmountRow(label: "Amount", value: "\$0.00"),
            _buildAmountRow(label: "VAT", value: "\$0.00"),
            const Divider(thickness: 1, color: Colors.grey),
            _buildAmountRow(
              label: "Total Amount",
              value: "\$0.00",
              isBold: true,
            ),
            const SizedBox(height: 30),
            // Pay Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  showBasicPopup(context, "Paid Successfully",
                      "Your Payment has been successfully Paid.");
                },
                child: const Text(
                  "Pay Now",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Widget to display payment options
  Widget _buildPaymentOption({
    required String logo,
    required String title,
    String? subtitle,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: isSelected ? Colors.orange : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Radio Button
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.orange : Colors.grey.shade400,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
          const SizedBox(width: 12),
          // Payment Method Logo
          Image.asset(
            logo,
            height: 25,
            width: 40,
          ),
          const SizedBox(width: 12),
          // Title and Subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget for Payment Details Row
  Widget _buildAmountRow({
    required String label,
    required String value,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

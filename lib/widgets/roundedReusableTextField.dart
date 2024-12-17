import 'package:business_card_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// Reusable TextFormField widget
class Roundedreusabletextfield extends StatelessWidget {
  final String? labelText;
  final String fieldLabel;
  final TextEditingController? controller;

  const Roundedreusabletextfield({
    super.key,
    this.labelText = "",
    this.controller,
    required this.fieldLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText != ""
              ? Text(
                  labelText!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                )
              : SizedBox(),
          SizedBox(height: 6),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: fieldLabel,
              labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: TColors.greyCustomColor, // Border color when enabled
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.blue, // Border color when focused
                  width: 2.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.red, // Border color when there’s an error
                  width: 2.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.redAccent, // Border color when focused on error
                  width: 2.0,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

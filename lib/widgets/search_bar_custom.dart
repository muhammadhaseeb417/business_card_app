import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

Container SearchBarCustom() {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Container(
            margin: EdgeInsets.all(6),
            padding: const EdgeInsets.all(4), // Add padding for proper spacing
            decoration: BoxDecoration(
              color: TColors.orangeCustomColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.asset("assets/search.png", height: 20),
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: TColors.greyCustomColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: TColors.orangeCustomColor,
              width: 2.0,
            ),
          ),
        ),
      ));
}

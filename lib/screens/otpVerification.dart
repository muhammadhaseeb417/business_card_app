import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onInputChanged(String value, int index) {
    if (value.isNotEmpty) {
      // Move to next field if not the last
      if (index < 3) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
    } else if (value.isEmpty) {
      // Move to previous field if not the first
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            // Logo Section

            const SizedBox(height: 40),
            // Heading Section
            const Center(
              child: Text(
                "Verification Code",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Info Section
            const Text(
              "Please enter the code we just have sent to email \n+432 ***********",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            // OTP Input Row Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => OtpInputField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  onChanged: (value) => _onInputChanged(value, index),
                ),
              ),
            ),
            const SizedBox(height: 150),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Didn’t receive OTP?"),
                Text(
                  "Resend Code",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                showBasicPopup(context);
              },
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        showBasicPopup(context);
                      },
                      child: Text("Verify"))),
            ),
            // Buttons Section
          ],
        ),
      ),
    );
  }

  void showBasicPopup(BuildContext context) {
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
              const Text(
                "Added Successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              // Message
              const Text(
                "Your account has been successfully added.",
                textAlign: TextAlign.center, // Center-align text
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, "/confirmation"); // Close the pop-up
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
}

// The other widget classes (OtpInputField, CustomButton) remain the same as in the original code

// OTP Input Row with Focus Handling
class OtpInputRow extends StatefulWidget {
  const OtpInputRow({super.key});

  @override
  _OtpInputRowState createState() => _OtpInputRowState();
}

class _OtpInputRowState extends State<OtpInputRow> {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onInputChanged(String value, int index) {
    if (value.isNotEmpty) {
      // Move to next field if not the last
      if (index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      }
    } else if (value.isEmpty) {
      // Move to previous field if not the first
      if (index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
        (index) => OtpInputField(
          controller: controllers[index],
          focusNode: focusNodes[index],
          onChanged: (value) => _onInputChanged(value, index),
        ),
      ),
    );
  }
}

// Reusable OTP Input Field
class OtpInputField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const OtpInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  bool isFilled = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_checkFilled); // Listen to input changes
  }

  @override
  void dispose() {
    widget.controller.removeListener(_checkFilled);
    super.dispose();
  }

  void _checkFilled() {
    setState(() {
      isFilled = widget.controller.text.isNotEmpty; // Check if field is filled
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color:
            isFilled ? Colors.pink.shade50 : Colors.white, // Background color
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isFilled
              ? Color(0xFFE646461F)
              : Colors.grey.shade300, // Border color
          width: 2,
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        onChanged: (value) {
          widget.onChanged(value);
          _checkFilled(); // Recheck filled state when input changes
        },
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "",
        ),
      ),
    );
  }
}

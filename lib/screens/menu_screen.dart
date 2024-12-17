import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Name
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "JustApp",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            // Search Bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    "Search",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(left: 16),
                children: [
                  MenuItem(
                    icon: Icons.qr_code,
                    title: "Share QR",
                    onTap: () => Navigator.pushNamed(context, "/qrScan"),
                  ),
                  MenuItem(
                    icon: Icons.notification_add,
                    title: "Notification",
                    onTap: () => Navigator.pushNamed(context, "/notification"),
                  ),
                  MenuItem(
                    icon: Icons.inbox,
                    title: "Inbox",
                    onTap: () => Navigator.pushNamed(context, "/inbox"),
                  ),
                  MenuItem(
                    icon: Icons.person,
                    title: "Lead",
                    onTap: () => Navigator.pushNamed(context, "/lead"),
                  ),
                  MenuItem(
                    icon: Icons.payment,
                    title: "Add Payment",
                    onTap: () => Navigator.pushNamed(context, "/addPayment"),
                  ),
                  MenuItem(
                    icon: Icons.payment,
                    title: "Payment Method",
                    onTap: () => Navigator.pushNamed(context, "/paymentMethod"),
                  ),
                  MenuItem(icon: Icons.home, title: "Home"),
                  MenuItem(
                      icon: Icons.credit_card,
                      title: "Card and Tag",
                      hasDropdown: true),
                  MenuItem(
                      icon: Icons.qr_code_scanner, title: "QR Code Activation"),
                  MenuItem(icon: Icons.people, title: "Partner Program"),
                  MenuItem(
                      icon: Icons.handshake,
                      title: "Request partnership approval"),
                  MenuItem(
                      icon: Icons.trending_up,
                      title: "Track earnings and referred clients"),
                  MenuItem(
                      icon: Icons.star_border,
                      title: "Rate Us on Trustpilot and Google"),
                ],
              ),
            ),

            // User Profile
            Divider(color: Colors.grey.shade300),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://via.placeholder.com/150"), // Placeholder image
              ),
              title: const Text(
                "Gustavo Xavier",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                width: 30,
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "Admin",
                  style: TextStyle(fontSize: 12, color: Colors.orange),
                ),
              ),
            ),

            // Settings & Log Out
            const MenuItem(
              icon: Icons.settings,
              title: "Settings",
              iconColor: Colors.black,
            ),
            const MenuItem(
              icon: Icons.logout,
              title: "Log out",
              iconColor: Colors.red,
              textColor: Colors.red,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool hasDropdown;
  final VoidCallback? onTap; // Add onTap
  final Color? iconColor;
  final Color? textColor;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.hasDropdown = false,
    this.onTap,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? Colors.black87,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: textColor ?? Colors.black87,
        ),
      ),
      trailing: hasDropdown
          ? const Icon(Icons.arrow_drop_down, color: Colors.black54)
          : null,
      onTap: onTap, // Add the tap handler here
    );
  }
}

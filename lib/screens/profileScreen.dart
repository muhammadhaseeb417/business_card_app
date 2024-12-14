import 'package:flutter/material.dart';

class ProfileListScreen extends StatelessWidget {
  const ProfileListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "JustApp",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Color(0xFFC55536)),
          ),
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/women/45.jpg'), // Sample profile pic
            radius: 16,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemCount: 8, // Number of profiles
        itemBuilder: (context, index) {
          return const ProfileCard();
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/men/45.jpg'), // Sample profile pic
          radius: 25,
        ),
        title: const Text("Ralph Edwards",
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text("Equinor - Oseberg C-19",
            style: TextStyle(color: Colors.grey)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.video_call, color: Color(0xFFC55536)),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

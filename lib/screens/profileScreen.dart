import 'package:flutter/material.dart';

class ProfileListScreen extends StatelessWidget {
  const ProfileListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              icon: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Image.asset(
                    'assets/plus.png',
                    width: 16, // Set the width of the image
                    height: 16, // Set the height of the image
                  ),
                ),
              )),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/confirmation3"),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/women/45.jpg'), // Sample profile pic
              radius: 16,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemCount: 8, // Number of profiles
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Container(
              height: 80,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/profile2.png", height: 35, width: 35),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Ralph Edwards",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const Text("Equinor - Oseberg C-19",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/writte.png", height: 37, width: 37),
                      SizedBox(width: 10),
                      Container(
                        height: 37,
                        width: 37,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(300)),
                        child: Image.asset(
                          "assets/eye.png",
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
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
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        selectedTileColor: Colors.white,
        tileColor: Colors.white,
        shape: Border.all(color: Colors.grey.shade300),
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/men/45.jpg'), // Sample profile pic
          radius: 22,
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
              icon: const Icon(Icons.remove_red_eye_rounded,
                  color: Color(0xFFC55536)),
            ),
          ],
        ),
      ),
    );
  }
}

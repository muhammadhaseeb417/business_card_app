import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

class InboxScreen extends StatefulWidget {
  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        title: const Text(
          "Inbox",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0), // Standard height for TabBar
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0), // Add horizontal padding
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5), // Background color (if needed)
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize
                    .tab, // Indicator occupies full tab width
                indicator: BoxDecoration(
                  color: Color(0xFFC55536), // Orange indicator
                  borderRadius: BorderRadius.circular(20),
                ),
                tabs: const [
                  Tab(child: Text("Chat", style: TextStyle(fontSize: 16))),
                  Tab(child: Text("Calls", style: TextStyle(fontSize: 16))),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Left Screen: Chat List
          ChatListScreen(),
          // Right Screen: Calls List
          CallsListScreen(),
        ],
      ),
    );
  }
}

// -------------------- Chat List Screen --------------------
class ChatListScreen extends StatelessWidget {
  final List<Map<String, String>> chatList = [
    {
      "name": "Natasha",
      "message": "Hi, Good Evening Bro.!",
      "time": "14:59",
      "count": "03"
    },
    {
      "name": "Alex",
      "message": "I Just Finished It.!",
      "time": "06:35",
      "count": "02"
    },
    {"name": "John", "message": "How are you?", "time": "08:10", "count": ""},
    {
      "name": "Mia",
      "message": "OMG, This is Amazing..",
      "time": "21:07",
      "count": "05"
    },
    {
      "name": "Maria",
      "message": "Wow, This is Really Epic",
      "time": "09:15",
      "count": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final chat = chatList[index];
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/chatScreen',
                arguments: chat['name']);
          },
          leading: CircleAvatar(
            backgroundColor: Colors.black,
          ),
          title: Text(chat['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(chat['message']!),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(chat['time']!),
              if (chat['count'] != "")
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    chat['count']!,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}

// -------------------- Calls List Screen --------------------
class CallsListScreen extends StatelessWidget {
  final List<Map<String, String>> callList = [
    {"name": "Johan", "type": "Incoming", "date": "Nov 03, 202X"},
    {"name": "Timothee Mathew", "type": "Incoming", "date": "Nov 05, 202X"},
    {"name": "Amariya", "type": "Outgoing", "date": "Nov 06, 202X"},
    {"name": "Tanisha", "type": "Missed", "date": "Nov 15, 202X"},
    {"name": "Shravya", "type": "Outgoing", "date": "Nov 17, 202X"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callList.length,
      itemBuilder: (context, index) {
        final call = callList[index];
        return ListTile(
          leading: CircleAvatar(backgroundColor: Colors.black),
          title: Text(call['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Row(
            children: [
              Text(call['type']!),
              const SizedBox(width: 8),
              Text(" | ${call['date']}"),
            ],
          ),
          trailing: const Icon(Icons.call, color: Colors.deepOrangeAccent),
        );
      },
    );
  }
}

// -------------------- Chat Detail Screen (Middle Screen) --------------------
class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text("Inbox"),
        actions: const [
          const Icon(Icons.call, color: Colors.black),
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text("Today"),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                      text: "Hi, Nicholas Good Evening 😎",
                      time: "10:45",
                      isSender: false),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                      text: "How was your UI/UX Design Course Like.? 😊",
                      time: "12:45",
                      isSender: true),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                      text: "Hi, Morning too Ronald",
                      time: "15:29",
                      isSender: false),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Message",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  //  spacing: 10,
                  children: [
                    Icon(Icons.pinch_sharp),
                    const CircleAvatar(
                      backgroundColor: Colors.deepOrangeAccent,
                      child: Icon(Icons.mic, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isSender;

  const ChatBubble({
    Key? key,
    required this.text,
    required this.time,
    this.isSender = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: !isSender
              ? BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(10),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(0),
                )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(color: Colors.white70, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

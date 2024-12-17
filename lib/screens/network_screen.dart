import 'package:business_card_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/search_bar_custom.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Search controllers
  TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  // Filtered List Data
  final List<String> _allContacts =
      List.generate(10, (index) => "Ralph Edwards");
  List<String> _filteredContacts = [];

  @override
  Widget build(BuildContext context) {
    // Filter the list when the search query changes
    _filteredContacts = _allContacts
        .where((contact) =>
            contact.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

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
          'Network Dashboard',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          SearchBarCustom(),

          // TabBar
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFFC55536),
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xFFC55536),
              tabs: const [
                Tab(child: Text("Pending Requests")),
                Tab(child: Text("Approved Contacts")),
              ],
            ),
          ),

          // TabBarView with Search Filtering
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Pending Requests
                _buildContactList("Pending"),
                // Approved Contacts
                _buildContactList("Approved"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build Contact List with Filtering
  Widget _buildContactList(String status) {
    return _filteredContacts.isEmpty
        ? const Center(child: Text("No contacts found"))
        : ListView.builder(
            itemCount: 8, // Number of profiles
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
                          Image.asset("assets/profile2.png",
                              height: 35, width: 35),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Ralph Edwards",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const Text("Equinor - Oseberg C-19",
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color:
                              status == "Pending" ? Colors.black : Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          status,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }

  // Contact Card Widget
  Widget _buildContactCard(String name, String status) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://via.placeholder.com/150',
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: const Text(
          'Equinor - Osberg C-19',
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: status == "Pending" ? Colors.black : Colors.green,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}

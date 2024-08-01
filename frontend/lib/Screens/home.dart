import 'package:flutter/material.dart';
import 'package:fwms/Screens/Dashboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Method to change the selected index in BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Navigation based on selected index
      if (index == 3) { // Index for 'Dashboard'
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      }
      // Handle other navigation here if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.all(10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.chat, color: Colors.teal),
          onPressed: () {
            // Navigate to chat screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.teal),
            onPressed: () {
              // Navigate to notifications screen
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.teal),
            onPressed: () {
              // Navigate to profile screen
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Sample data count
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                  title: Text('User Name'),
                  subtitle: Text('Location'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network('https://via.placeholder.com/300'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Post description goes here...',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        // Like post
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: () {
                        // Comment on post
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.repeat), // Repost icon
                      onPressed: () {
                        // Repost action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        // Share post
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
            label: 'Organization',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(Icons.add, color: Colors.white),
            ),
            label: 'Donor',
          ),
          BottomNavigationBarItem(
            
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Services',
          ),
        ],
      ),
    );
  }
}

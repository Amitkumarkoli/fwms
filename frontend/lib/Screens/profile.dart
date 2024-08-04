import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // Header Image
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://via.placeholder.com/400'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        // Add your edit logic here
                      },
                    ),
                  ),
                ),
                // Circular Profile Image
                Positioned(
                  bottom: -50,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            // Add your edit logic here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 60), // Space for the circular image
            Text(
              'Amit Kumar koli',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'amitkoli@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            // Phone and Address Section
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '+1 234 567 890',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '123 Main Street City, State, Zip Code',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(onPressed: () {}, child: Text('Edit')),
                ],
              ),
            ),
            SizedBox(height: 16),
            // My Contribution Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Contribution',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Type of Food')),
                        DataColumn(label: Text('Quantity')),
                        DataColumn(label: Text('Recipient Organization')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('08-01-2024')),
                          DataCell(Text('Cooked')),
                          DataCell(Text('10 kg')),
                          DataCell(Text('Food Bank')),
                          DataCell(Text('Delivered')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('07-28-2024')),
                          DataCell(Text('Uncooked')),
                          DataCell(Text('5 kg')),
                          DataCell(Text('Community Kitchen')),
                          DataCell(Text('Pending')),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'My Food Pickups',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Type of Food')),
                        DataColumn(label: Text('Quantity')),
                        DataColumn(label: Text('Donor')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('08-01-2024')),
                          DataCell(Text('Cooked')),
                          DataCell(Text('20 pcs')),
                          DataCell(Text('Bakery Shop')),
                          DataCell(Text('Picked Up')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('07-29-2024')),
                          DataCell(Text('Uncooked')),
                          DataCell(Text('10 liters')),
                          DataCell(Text('Dairy Farm')),
                          DataCell(Text('Pending')),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

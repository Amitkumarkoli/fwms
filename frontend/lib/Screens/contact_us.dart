import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  // Google Maps controller
  late GoogleMapController _mapController;

  // Default location (example coordinates)
  final LatLng _center = const LatLng(37.7749, -122.4194); // Example: San Francisco

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void dispose() {
    // Dispose of controllers when the widget is removed from the widget tree
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Contact Us')),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container with rounded top corners
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Get in Touch Section
                  Text(
                    'Get in Touch',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 16.0),

                  // Phone Number
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.teal),
                      SizedBox(width: 8.0),
                      Text(
                        'Phone Number:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '+1 234 567 890',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),

                  // Email
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.teal),
                      SizedBox(width: 8.0),
                      Text(
                        'Email:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'contact@example.com',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),

                  // Address
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: Colors.teal),
                      SizedBox(width: 8.0),
                      Text(
                        'Address:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '123 Main Street, City, State, Zip Code',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),

                  // Contact Form Section
                  Text(
                    'Contact Form',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 16.0),

                  // Name Field
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your Name',
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                  SizedBox(height: 16.0),

                  // Email Field
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your Email',
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                  SizedBox(height: 16.0),

                  // Message Field
                  TextField(
                    controller: _messageController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Write your message here',
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                  SizedBox(height: 16.0),

                  ElevatedButton(
                    onPressed: () {
                      // Handle submit action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Message sent successfully!'),
                        ),
                      );
                    },
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 24.0),

                  // Our Location Section
                  Text(
                    'Our Location',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 250.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 14.0,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId('location'),
                          position: _center,
                        ),
                      },
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

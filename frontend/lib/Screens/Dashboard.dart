import 'package:flutter/material.dart';
import 'package:fwms/Screens/Request_screen.dart';
import 'package:fwms/Screens/analytics.dart';
import 'package:fwms/Screens/contact_us.dart';
import 'package:fwms/Screens/features.dart';
import 'package:fwms/Screens/product_screen.dart';
import 'package:fwms/Screens/profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<String> cardImages = [
    'assets/person.png',
    'assets/request.png',
    'assets/Analytics.png',
    'assets/product.png',
    'assets/features.png',
    'assets/contact.png',
  ];

  final List<String> cardTitles = [
    'My Account',
    'Request',
    'Analytics',
    'Product',
    'Features',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SafeArea(
        child: Stack(
          children: [
            // Existing Container with Cards
            Positioned.fill(
              top: 250, // Provide space for the top header
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: cardImages.length, // Total number of cards
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of cards per row
                          crossAxisSpacing:
                              16.0, // Horizontal spacing between cards
                          mainAxisSpacing:
                              16.0, // Vertical spacing between cards
                          childAspectRatio: 3 / 4, // Aspect ratio of the cards
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              switch (cardTitles[index]) {
                                case 'My Account':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfileScreen(),
                                    ),
                                  );
                                  break;
                                case 'Request':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RequestScreen(),
                                    ),
                                  );
                                  break;
                                case 'Analytics':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AnalyticsScreen(),
                                    ),
                                  );
                                  break;
                                case 'Product':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductScreen(),
                                    ),
                                  );
                                  break;
                                case 'Features':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FeaturesScreen(),
                                    ),
                                  );
                                  break;
                                case 'Contact':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ContactUsPage(),
                                    ),
                                  );
                                  break;
                                default:
                                  // Handle unknown card
                                  break;
                              }
                            },
                            // Handle other card taps if necessary
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              elevation: 4.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height:
                                        100, // Set a smaller fixed height for the image
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16.0),
                                      ),
                                      child: Image.asset(
                                        cardImages[index],
                                        fit: BoxFit
                                            .contain, // Adjusts the image to fit within the container
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      cardTitles[index],
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Top Header
            Positioned(
              top: 20,
              right: 20,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Image.asset(
                    'assets/profile.png'), // Replace with your circular image
              ),
            ),
            Positioned(
              top: 120,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    'Last Update 25 July 2024',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
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

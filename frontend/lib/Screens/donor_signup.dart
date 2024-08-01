
import 'package:flutter/material.dart';

class DonorSignupScreen extends StatefulWidget {
  const DonorSignupScreen({super.key});

  @override
  State<DonorSignupScreen> createState() => _DonorSignupScreenState();
}

class _DonorSignupScreenState extends State<DonorSignupScreen> {
  final TextEditingController _restaurantNameController =
      TextEditingController();
  final TextEditingController _foodTypeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _pickingTimeController = TextEditingController();
  final TextEditingController _additionalNoteController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60), 
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Image.asset('assets/logo.png'), 
          ),
          SizedBox(height: 40),
          Expanded(
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    Text(
                      'Donor Information',
                       style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 20),
                    
                    TextFormField(
                      controller: _restaurantNameController,
                      decoration: InputDecoration(
                        labelText: 'Restaurant Name/Hotel/Event Name',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    TextFormField(
                      controller: _foodTypeController,
                      decoration: InputDecoration(
                        labelText: 'Type of Food',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    TextFormField(
                      controller: _quantityController,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    TextFormField(
                      controller: _pickingTimeController,
                      decoration: InputDecoration(
                        labelText: 'Picking Time',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            _pickingTimeController.text =
                                pickedTime.format(context);
                          });
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    
                    TextFormField(
                      controller: _additionalNoteController,
                      maxLines: 5, 
                      decoration: InputDecoration(
                        labelText: 'Additional Note',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    ElevatedButton(
                      onPressed: () {
                        
                        
                        String restaurantName = _restaurantNameController.text;
                        String foodType = _foodTypeController.text;
                        String quantity = _quantityController.text;
                        String pickingTime = _pickingTimeController.text;
                        String additionalNote = _additionalNoteController.text;

                        
                      },
                      child: Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.yellow,
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

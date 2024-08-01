import 'package:flutter/material.dart';
import 'package:fwms/Screens/donor_signup.dart';
import 'package:fwms/Screens/organization_signup.dart';
import 'package:fwms/screens/login.dart';
import 'package:fwms/screens/signup.dart';
import 'package:fwms/screens/home.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginScreen(),
  '/signup': (context) => SignupScreen(),
  '/donorsignup': (context) => DonorSignupScreen(),
  '/organizationsignup': (context) => OrganizationSignupScreen(),
  '/home': (context) => HomeScreen(),
};

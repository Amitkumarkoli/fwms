import 'package:flutter/material.dart';
import 'package:fwms/routes/routes.dart';
import 'package:fwms/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FWMS',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}

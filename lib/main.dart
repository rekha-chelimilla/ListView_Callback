import 'package:flutter/material.dart';
import 'package:list_view_app/AppPages.dart';
import 'package:list_view_app/AppRoutes.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.intitial,
      routes: AppPages.routes,
    );
  }
}

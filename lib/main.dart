import 'package:flutter/material.dart';
import 'pages/list_ordonnance_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mediscan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListOrdonnancePage(),
    );
  }
}

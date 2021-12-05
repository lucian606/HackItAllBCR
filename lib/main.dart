import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'screens/search_screen.dart';

void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return const MaterialApp(
        home: SearchScreen(),
    );
  }
}

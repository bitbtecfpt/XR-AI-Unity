import 'package:flutter/material.dart';
import 'presentation/screens/login_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(), // Màn hình khởi đầu

    );
  }
}

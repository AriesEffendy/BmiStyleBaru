import 'package:bmi_style_baru/views/gender_view_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffC2DED1),
        ),
        
        primarySwatch: Colors.blue,
      ),
      home: const GenderViewscreen(),
    );
  }
}


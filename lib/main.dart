import 'package:cvf/widgets/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CVF',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentIconTheme: IconThemeData(
          color: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.underdog(color: Colors.black),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}

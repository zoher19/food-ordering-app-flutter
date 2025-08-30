import 'package:flutter/material.dart';
import 'package:foo_app/pages/LoginInPage.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food_app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         colorScheme: ColorScheme.dark(primary: Colors.black,secondary: const Color.fromARGB(228, 2, 73, 19)),
          scaffoldBackgroundColor: Color(0xFFF5F5F5),
         textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),

      ),
      
    
      home:Logininpage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuscessPage extends StatefulWidget {

  @override
  _SuscessPageState createState() => _SuscessPageState();
}

class _SuscessPageState extends State<SuscessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Login Suscess !!' , style: GoogleFonts.prompt(fontSize: 20,color:Colors.black),),
      ),
    );
  }
}
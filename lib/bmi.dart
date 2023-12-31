import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
 const BMI({Key? key, required this.title}) : super(key: key); 

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  TextEditingController outputController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime(2101),
    );
    int month = currentDate.month;
    int dates = currentDate.day;
    int year = currentDate.year;
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    if (selectedDate.day > currentDate.day) {
      month = currentDate.month - 1;
      dates = currentDate.day + (selectedDate.month - 1);
    }
    if (selectedDate.month > currentDate.month) {
      year = currentDate.year - 1;
      month = currentDate.month + 12;
    }
    int birthDay = dates - selectedDate.day;
    int birthMonth = month - selectedDate.month;
    int birthYear = year - selectedDate.year;
    outputController.text = "year:$birthYear-Months:$birthMonth-Days:$birthDay";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 200.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () => _selectDate(context),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black))),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent)),
                child: const Text(
                  'Select Birth Date',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
            ),
            SizedBox(
              width: 300.0,
              height: 50.0,
              child: TextFormField(
                controller: outputController,
                enabled: false,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  labelText: 'Your Age Is:',
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

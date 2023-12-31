import 'package:age/bmi.dart';
import 'package:flutter/material.dart';

import 'age.dart';

/// Flutter code sample for [ElevatedButton].

void main() => runApp(const ElevatedButtonExampleApp());

class ElevatedButtonExampleApp extends StatelessWidget {
  const ElevatedButtonExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Calculators')),
        backgroundColor: Colors.teal,
        body: const ElevatedButtonExample(),
      ),
    );
  }
}

class ElevatedButtonExample extends StatefulWidget {
  const ElevatedButtonExample({super.key});

  @override
  State<ElevatedButtonExample> createState() => _ElevatedButtonExampleState();
}

class _ElevatedButtonExampleState extends State<ElevatedButtonExample> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 400.0,
            height: 50.0,
            child: ElevatedButton(
              child: Text(
                'AGE CALCULATOR',
                style: TextStyle(fontSize: 20.0),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black))),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return MyHomePage(
                    title: 'AGE Calculator',
                  );
                }));
              },
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 400.0,
            height: 50.0,
            child: ElevatedButton(
              child: Text(
                'BMI CALCULATOR',
                style: TextStyle(fontSize: 20.0),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black))),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const BMI(
                    title: 'BMI Calculator',
                  );
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}

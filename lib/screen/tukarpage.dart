import 'package:flutter/material.dart';

class TukarPageScreen extends StatefulWidget {
  const TukarPageScreen({Key? key}) : super(key: key);

  @override
  State<TukarPageScreen> createState() => _TukarPageScreenState();
}

class _TukarPageScreenState extends State<TukarPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        "Tukar Page",
        style: TextStyle(fontSize: 22),
      )),
    );
  }
}

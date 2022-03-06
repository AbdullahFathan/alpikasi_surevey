import 'package:flutter/material.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        "Profile Page",
        style: TextStyle(fontSize: 22),
      )),
    );
  }
}

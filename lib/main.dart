import 'package:bmi/constants.dart';
import 'package:bmi/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: cprimarycolor,
        scaffoldBackgroundColor: cprimarycolor,
      ),
      home: const homepage(),
    ));
  }
}

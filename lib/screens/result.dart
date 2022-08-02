import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'homepage.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  }) : super(key: key);
  final Gender gender;
  final int height;
  final int age;
  final int weight;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double bmi = 0.0;
  String result = '';
  String gender = '';
  String img = '';

  void calculate() {
    setState(() {
      gender = this.widget.gender == Gender.male ? 'male' : 'female';

      bmi = this.widget.weight /
          ((this.widget.height / 100) * (this.widget.height / 100));
      if (bmi < 18.5) {
        result = 'UnderWeight';
      } else if (bmi < 25) {
        result = 'Normal';
      } else if (bmi < 30) {
        result = 'OverWeight';
      } else if (bmi < 35) {
        result = 'Obese';
      } else {
        result = 'ExtremelyObese';
      }

      img = 'images/male_female(1)/${gender}_${result}.png';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      calculate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "RESULT",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 200,
            color: Color.fromARGB(255, 54, 79, 91),
            child: Image.asset(this.img),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "SCORE : ",
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
            ),
          ),
          Text(
            '${this.bmi.toStringAsFixed(2)} kg/m2 ',
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '${result}',
            style: TextStyle(
              fontSize: 50,
              color: Color.fromARGB(255, 243, 240, 238),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                print('Calculate');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return homepage();
                  }),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Color.fromARGB(255, 21, 117, 24),
                ),
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                    child: Text(
                  "RECALCULATE",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

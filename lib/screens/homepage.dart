import 'dart:html';

import 'package:bmi/components/custom_card.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Gender gender_selected = Gender.male;
  int height = 140;
  int weight = 50;
  int age = 30;
  @override
  Widget build(BuildContext context) {
    // var height = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: GenderCard(
                  icon: Icons.male,
                  gender: 'male'.toUpperCase(),
                  isSelected: gender_selected == Gender.male ? true : false,
                  onTap: () {
                    setState(() {
                      gender_selected = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: GenderCard(
                  icon: Icons.female,
                  gender: 'Female'.toUpperCase(),
                  isSelected: gender_selected == Gender.female ? true : false,
                  onTap: () {
                    setState(() {
                      gender_selected = Gender.female;
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: SliderCard(
              value: height,
              title: 'HEIGHT',
              unit: 'cm',
              onChanged: (val) {
                setState(() {
                  height = val.toInt();
                  print(height);
                });
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: AgeWeightcard(
                  title: 'AGE',
                  value: age,
                  onPressedminus: () {
                    setState(() {
                      age--;
                    });
                  },
                  onPressedplus: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ),
              Expanded(
                child: AgeWeightcard(
                  title: 'WEIGHT',
                  value: weight,
                  onPressedminus: () {
                    setState(() {
                      weight--;
                    });
                  },
                  onPressedplus: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              title: "Calculate",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        gender: gender_selected,
                        height: height,
                        age: age,
                        weight: weight,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

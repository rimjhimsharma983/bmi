import 'dart:html';

import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key? key,
    required this.gender,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final IconData icon;
  final String gender;
  final onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? cCardprimaryBGColorSelected : cCardPrimaryBGColor,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.icon,
              size: 100,
            ),
            SizedBox(height: 10),
            Text(
              this.gender,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AgeWeightcard extends StatelessWidget {
  const AgeWeightcard({
    Key? key,
    this.title = '',
    this.value = 0,
    required this.onPressedminus,
    required this.onPressedplus,
  }) : super(key: key);
  final String title;
  final int value;
  final onPressedminus;
  final onPressedplus;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 46, 35, 35),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            '${this.value}',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonRound(
                text: '+',
                onPressed: this.onPressedplus,
              ),
              ButtonRound(
                text: '-',
                onPressed: this.onPressedminus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonRound extends StatelessWidget {
  const ButtonRound({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          this.text,
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      shape: CircleBorder(),
      fillColor: Color.fromARGB(31, 28, 14, 14),
    );
  }
}

class SliderCard extends StatelessWidget {
  const SliderCard({
    Key? key,
    required this.onChanged,
    this.title = '',
    this.value = 0,
    this.unit = '',
  }) : super(key: key);
  final onChanged;
  final String title;
  final String unit;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 34, 28, 28),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      margin: EdgeInsets.only(top: 0, right: 25, left: 25, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${this.value}',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                this.unit,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Color.fromARGB(255, 105, 202, 250),
              inactiveTrackColor: Color.fromARGB(255, 102, 136, 187),
              overlayColor: Color.fromARGB(51, 1, 38, 65),
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 10,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 20,
              ),
            ),
            child: Slider(
              value: this.value.toDouble(),
              min: 0.0,
              max: 250.0,
              onChanged: this.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
          color: Color.fromARGB(255, 49, 85, 85),
          margin: EdgeInsets.only(
            top: 0,
          ),
          child: Center(
            child: Text(
              this.title,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )),
    );
  }
}

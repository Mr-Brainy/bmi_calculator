import 'package:bmi_calculator/Widgets/left_bar.dart';
import 'package:bmi_calculator/Widgets/right_bar.dart';
import 'package:bmi_calculator/constant/app_const.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _massController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainHexColor,
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            color: accentHexColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontSize: 43,
                        fontWeight: FontWeight.w400,
                        color: Colors.pink.withOpacity(.9),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _massController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mass',
                      hintStyle: TextStyle(
                        fontSize: 43,
                        fontWeight: FontWeight.w400,
                        color: Colors.pink.withOpacity(.9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                double h = double.parse(_heightController.text);
                double m = double.parse(_massController.text);

                setState(() {
                  _bmiResult = m / (h * h);
                  if (_bmiResult > 25) {
                    _textResult = 'You\'re over weight';
                  } else if (_bmiResult >= 17.5 && _bmiResult <= 25) {
                    _textResult = 'You have normal weight';
                  } else {
                    _textResult = 'You are under weight';
                  }
                });
              },
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: redHexColor,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 40,
                color: redHexColor,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: accentHexColor,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const RightBar(barWidth: 70),
            const SizedBox(
              height: 20,
            ),
            const RightBar(barWidth: 100),
            const SizedBox(
              height: 20,
            ),
            const RightBar(barWidth: 70),
            const SizedBox(
              height: 30,
            ),
            const LeftBar(barWidth: 70),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 80),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 70),
            const SizedBox(
              height: 90,
            ),
            const Text(
              'Designed by "Mr-Brainy"',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

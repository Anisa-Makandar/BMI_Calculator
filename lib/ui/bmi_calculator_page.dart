import 'dart:math';

import 'package:flutter/material.dart';

class BmiCalculatorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BmiCalculatorPageState();
}

class BmiCalculatorPageState extends State<BmiCalculatorPage> {
  TextEditingController wtController = TextEditingController();
  TextEditingController htFtController = TextEditingController();
  TextEditingController htInCntroller = TextEditingController();
  String? bmi;
  String? healthType;
  String imageAsset = "";

  Color bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: const Color(0xFF88CFC7),
          toolbarHeight: 70,
          centerTitle: true,
          title: const Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: wtController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your weight (kg)',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      label: Text('Weight (kg)'),
                      prefixIcon: const Icon(Icons.line_weight),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFB6AEFF),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFC8C7C7),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: htFtController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your Height (Feet)',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      label: Text('Height (ft)'),
                      prefixIcon: const Icon(Icons.height),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFB6AEFF),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFC8C7C7),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: htInCntroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your Height (Inches)',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      label: Text('Height (In)'),
                      prefixIcon: const Icon(Icons.height),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFB6AEFF),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFC8C7C7),
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 25),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        calculateBMI();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF88CFC7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Calculate',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Text('${bmi ?? 'Enter your Height and Weight'}'),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${healthType ?? ""}',
                  style: TextStyle(
                      color: bgColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15,
                ),
                // Text('${imageAsset ?? ""}'),
                imageAsset.isNotEmpty
                    ? Image.asset(imageAsset, height: 200, width: 200)
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    double? wt = double.parse(wtController.text.toString());
    double? htFt = double.parse(htFtController.text.toString());
    double? htIn = double.parse(htInCntroller.text.toString());

    //Where 1 feet 12 inches
    num totalInches = (htFt * 12) + htIn;

    //Where 1 In = 2.54 cm
    num totalCM = 2.54 * totalInches;

    //Where 1M = 100 CM but i want 1CM = 1/100 M
    num totalM = totalCM / 100;

    double result = (wt / (pow(totalM, 2.0)));

    if (result > 25) {
      healthType = "Overweight";
      bgColor = Colors.red.shade200;
      imageAsset = 'assets/images/obesity.png';
    } else if (result < 18) {
      healthType = "Underweight";
      bgColor = Colors.blue.shade200;
      imageAsset = 'assets/images/bg_underweight.png';
    } else {
      healthType = "Healthy";
      bgColor = Colors.green.shade200;
      imageAsset = 'assets/images/bg_normalweight.png';
    }

    bmi = result.toStringAsFixed(2);
    setState(() {});
  }
}

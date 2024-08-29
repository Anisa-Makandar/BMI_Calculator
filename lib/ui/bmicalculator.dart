import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});
  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double _bmi = 0.0;
  String result = "";
  String imageAsset = "";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
                height: 150), // Adds spacing above the first TextField
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter your weight (kg)',
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter your height (cm)',
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
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
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
              child: SizedBox(
                height: 50,
                width:
                    double.infinity, // Make the button fill the available width
                child: ElevatedButton(
                  onPressed: () {
                    _calculateBmi(
                      height: heightController.text,
                      weight: weightController.text,
                    );
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
            const SizedBox(height: 30),
            _bmi == 0.0
                ? const Text(
                    'Enter your Height and Weight',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  )
                : Column(
                    children: [
                      Text(
                        'Your BMI: ${_bmi.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        result,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      imageAsset.isNotEmpty
                          ? Image.asset(imageAsset, height: 200, width: 200)
                          : Container(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  _calculateBmi({required String height, required String weight}) {
    if (height.isEmpty || weight.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Enter your height and weight'),
      ));
    } else {
      final double heightInMeters = double.parse(height) / 100;
      final double weightInKg = double.parse(weight);
      setState(() {
        _bmi = weightInKg / (heightInMeters * heightInMeters);
        if (_bmi < 18.5) {
          result = 'Underweight';
          // result = Text(
          //   'Underweight',
          //   style: TextStyle(color: Colors.blue),
          // ) as String;
          imageAsset = 'assets/images/bg_underweight.png';
        } else if (_bmi >= 18.5 && _bmi < 24.9) {
          result = 'Normal weight';
          imageAsset = 'assets/images/bg_normalweight.png';
        } else if (_bmi >= 25 && _bmi < 29.9) {
          result = 'Overweight';
          imageAsset = 'assets/images/bg_overweight.png';
        } else {
          result = 'Obesity';
          imageAsset = 'assets/images/obesity.png';
        }
      });
    }
  }
}

import 'dart:async';
import 'package:bmi_calculator/ui/bmi_calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BmiCalculatorPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                  child: Text(
                'BMI calculator',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 70), // Adjust the top padding as needed
              child: Center(
                child: Container(
                  width: 350, // Adjust the width as needed
                  height: 300, // Adjust the height as needed
                  child: Image.asset(
                    'assets/icons/ic_splashscreenbmiicon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // SizedBox(height: 8),
            Text(
              'Healthy',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4BB19B),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Male',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Image.asset(
                        'assets/icons/ic_male.png',
                        // width: 250,
                        // height: 200,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Female',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Image.asset(
                        'assets/icons/ic_femaleicon4.png',
                        // width: 250,
                        // height: 200,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Age',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFD7D8DC),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '---',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF585858),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height:
                      40, // Set the height you want for the vertical divider
                  child: VerticalDivider(
                    thickness: 1,
                    color: Color(0xFFD1D3D4),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFD7D8DC),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '---',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF585858),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    thickness: 1,
                    color: Color(0xFFD1D3D4),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Weight',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFD7D8DC),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '---',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF585858),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Color(0xFF88CFC7),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 15.0),
      //     child: Center(
      //       child: Text(
      //         'Calculate BMI',
      //         style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.w400,
      //           color: Color(0xFFEFF9F6),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

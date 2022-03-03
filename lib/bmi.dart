import 'package:flutter/material.dart';

import 'home.dart';
double bmi = 0;
String msg = "";

void calculator(x) {
  if (x < 18)
    msg = "underweight";
  else if (x >= 18 && x <= 24.9)
    msg = "Normale";
  else if (x >= 25 && x < 30)
    msg = "overweight";
  else
    msg = "obese";
}

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  void CalculBmi() {
    print(bmi);
    print(height);
    setState(() {
      bmi = weight / (height * height * 0.0001);
    });
  }

  @override
  Widget build(BuildContext context) {
    CalculBmi();
    calculator(bmi);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "BMI",
                      style: TextStyle(fontSize: 30),
                    ),
                    Image.asset(
                      "assets/images/bmi_icon.png",
                      height: 40,
                      width: 40,
                    )
                  ]),
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Your BMI is :",
                        style: TextStyle(fontSize: 25),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.07,
                        width: MediaQuery.of(context).size.width*0.2,
                        child: Center(
                            child: Text(
                          "${bmi.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 20),
                        )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: Colors.black,width: 1.5)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      "assets/images/bmi_index.png",

                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.09,
                    width: MediaQuery.of(context).size.width*0.35,
                    child: Center(
                      child: Text(
                        "$msg",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Love yourself the way you are but\nyour heath matters too",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

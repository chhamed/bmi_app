import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'bmi.dart';

int weight = 70;
int age = 20;
double _value = 100;
var height=100.0;
int x = 7;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool male;

  int? decrease(y) {
    setState(() {
      y--;
    });
    return y;
  }

  int? increase(x) {
    setState(() {
      x++;
    });
    return x;
  }

  @override
  void initState() {
    male = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) => Scaffold(
            bottomNavigationBar: LayoutBuilder(
              builder: (_, __) {
                return Container(
                  color: Colors.cyan,
                  height: __.biggest.height * 0.075,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Bmi()));

                      },
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 20),
                      )),
                );
              },
            ),
            appBar: AppBar(
              title: Text("BMI Calculator"),
            ),
            body: Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 11,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            male = true;
                            x = 0;
                          });
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text("Male",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black)),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              "assets/images/male-gender.png",
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: !male ? Colors.white : Colors.blue,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.4,
                              MediaQuery.of(context).size.height * 0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            male = false;
                            x = 1;
                          });
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text("Female",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black)),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              "assets/images/femenine.png",
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: male ? Colors.white : Colors.pink,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.4,
                              MediaQuery.of(context).size.height * 0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 11,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,

                    child: Center(
                        child: Column(

                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Height", style: TextStyle(fontSize: 25)),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.blue,
                                inactiveTrackColor: Colors.white,
                                trackShape: RoundedRectSliderTrackShape(),
                                trackHeight: 4.0,
                                thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                                thumbColor: Colors.blue,
                                overlayColor: Colors.blue.withAlpha(32),
                                overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 28.0),
                                tickMarkShape: RoundSliderTickMarkShape(),
                                valueIndicatorShape:
                                PaddleSliderValueIndicatorShape(),
                              ),
                              child: Slider(
                                value: _value,
                                min: 100,
                                max: 250,
                                divisions: 150,
                                label: '${_value.round()}',
                                onChanged: (value) {
                                  setState(
                                        () {
                                      _value = value;
                                      height = _value;
                                    },
                                  );
                                },
                              ),
                            ),
                            Text(
                              "${_value.round()}",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.cyan,
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.22,
                        width: MediaQuery.of(context).size.width*0.37,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "weight",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$weight",
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                  heroTag: 0,
                                  mini: true,
                                  onPressed: () {
                                    setState(() {
                                      weight = increase(weight)!;
                                    });
                                  },
                                  child: Icon(Icons.add),
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  heroTag: 1,
                                  onPressed: () {
                                    setState(() {
                                      weight = decrease(weight)!;
                                    });
                                  },
                                  child: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.cyan,
                        ),

                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.22,
                        width: MediaQuery.of(context).size.width*0.37,

                        child: Column(

                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Age",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "$age",
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  heroTag: 3,
                                  onPressed: () {
                                    setState(() {
                                      age = increase(age)!;
                                    });
                                  },
                                  child: Icon(Icons.add),
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  heroTag: 4,
                                  onPressed: () {
                                    age = decrease(age)!;
                                  },
                                  child: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.cyan,
                        ),

                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
        ));
  }
}

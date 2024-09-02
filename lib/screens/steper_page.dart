import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';


class BmiHomeScreen extends StatefulWidget {
  const BmiHomeScreen({super.key});

  @override
  State<BmiHomeScreen> createState() => _BmiHomeScreenState();
}

class _BmiHomeScreenState extends State<BmiHomeScreen> {
  bool iscalculate = false;
  int age = 22;
  int weight = 55;
  double heightCm = 170;
  int heightFeet = 5;
  int heightInches = 7;
  bool isCm = true;
  bool isMale = true;

  void _calculateBmi() {
    double heightInMeters =
    isCm ? heightCm / 100 : (heightFeet * 12 + heightInches) * 0.0254;
    double bmi = weight / (heightInMeters * heightInMeters);
    String description;

    if (bmi < 18.5) {
      description =
      "                       Underweight \nYour BMI suggests that you may be underweight.it's important to maintain a healthy weight to support your overall well-being.";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      description =
      "                      Normal weight \n Congratulations! Your BMI falls within the normal range.This is associated with good overall heath.keep up the healthy habits with a blanced diet and regular exercise to maintain your well-being.";
    } else if (bmi >= 25 && bmi < 29.9) {
      description =
      "                      Overweight \n Your BMI indicates that you \n may be overweight.\n Excess weight can contribute to various helth issues.";
    } else {
      description = description =
      "                       Overweight  \nYour BMI indicates that you  may be overweight. Excess weight  can contribute to various helth issues.";
    }
    setState(() {
      iscalculate != iscalculate;
    });
    iscalculate
        ? CircularProgressIndicator()
        : showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.purple[50],
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your BMI is :   ${bmi.toStringAsFixed(2)}',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateHeightUnit(bool value) {
    setState(() {
      isCm = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 177, 232),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.home,
              size: 33,
              color: Colors.white,
            ),
          );
        }),
        backgroundColor: const Color.fromARGB(255, 97, 177, 232),
        title: const Text(
          "BMI Calculation",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Container(
            height: 30,
            width: 80,
            child: LiteRollingSwitch(
                width: 90,
                textOn: 'Night',
                textOff: 'Day',
                colorOn: Color.fromARGB(255, 114, 113, 113),
                colorOff: Colors.yellow,
                iconOn: Icons.nightlight_round,
                iconOff: Icons.wb_sunny,
                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {},
                onChanged: (value) {}),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Stack(children: [
                CircleAvatar(
                  radius: 80,
                ),
                Positioned(
                  top: 125,
                  left: 105,
                  child: Icon(
                    Icons.camera_alt,
                    size: 40,
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person_outline_sharp, size: 30),
                title: Text("Name"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.info, size: 30),
                title: Text("info"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.contactless_sharp, size: 30),
                title: Text("about me"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.settings, size: 30),
                title: Text("setting"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            SizedBox(
              height: 390,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 78.0),
              child: Text(
                " @Ayaz Aslam",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 22.0, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 210,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 234, 236, 239),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text(age.toString(),
                            style: TextStyle(
                                fontSize: 37, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 94, 92, 92),
                                        blurRadius: 10,
                                        spreadRadius: 0.2)
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontSize: 38,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 94, 92, 92),
                                        blurRadius: 10,
                                        spreadRadius: 0.2)
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 210,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 234, 236, 239),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight(kg)",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text(weight.toString(),
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (weight > 0) weight--;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 94, 92, 92),
                                        blurRadius: 10,
                                        spreadRadius: 0.2)
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontSize: 38,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(255, 94, 92, 92),
                                        blurRadius: 10,
                                        spreadRadius: 0.2)
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text("+",
                                      style: TextStyle(
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Card(
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 234, 236, 239),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Height",
                                style: TextStyle(
                                    fontSize: 38, fontWeight: FontWeight.bold)),
                            Container(
                              height: 49,
                              width: 130,
                              child: LiteRollingSwitch(
                                  colorOff: Color.fromARGB(255, 188, 190, 191),
                                  colorOn: Color.fromARGB(255, 129, 131, 133),
                                  textOn: "CM",
                                  textOff: "FM",
                                  textSize: 30,
                                  iconOff: Icons.height,
                                  iconOn: Icons.height,
                                  onTap: () {},
                                  onDoubleTap: () {},
                                  onSwipe: () {},
                                  onChanged: _updateHeightUnit),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Card(
                          child: Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.amber,
                            ),
                            child: isCm
                                ? Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade200,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Cm",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (heightCm > 0) heightCm--;
                                          });
                                        },
                                        child: Icon(Icons.arrow_downward,
                                            size: 30),
                                      ),
                                      SizedBox(width: 10),
                                      Text(heightCm.toString(),
                                          style: TextStyle(
                                              fontSize: 41,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            heightCm++;
                                          });
                                        },
                                        child: Icon(Icons.arrow_upward,
                                            size: 30),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 100,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade200,
                                      borderRadius:
                                      BorderRadius.circular(15)),
                                  padding:
                                  EdgeInsets.only(left: 18, top: 6),
                                  child: Column(
                                    children: [
                                      Text('Feet',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (heightFeet > 0)
                                                  heightFeet--;
                                              });
                                            },
                                            child: Icon(
                                                Icons.arrow_downward,
                                                size: 30),
                                          ),
                                          SizedBox(width: 10),
                                          Text(heightFeet.toString(),
                                              style: TextStyle(
                                                  fontSize: 41,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                heightFeet++;
                                              });
                                            },
                                            child: Icon(Icons.arrow_upward,
                                                size: 30),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade200,
                                      borderRadius:
                                      BorderRadius.circular(15)),
                                  padding:
                                  EdgeInsets.only(left: 18, top: 6),
                                  child: Column(
                                    children: [
                                      Text('Inches',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (heightInches > 0)
                                                  heightInches--;
                                              });
                                            },
                                            child: Icon(
                                                Icons.arrow_downward,
                                                size: 30),
                                          ),
                                          SizedBox(width: 10),
                                          Text(heightInches.toString(),
                                              style: TextStyle(
                                                  fontSize: 41,
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                heightInches++;
                                              });
                                            },
                                            child: Icon(Icons.arrow_upward,
                                                size: 30),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 220, 224, 224),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("I'm a",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold)),
                      Container(
                        height: 50,
                        width: 100,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: LiteRollingSwitch(
                              textOn: "Male",
                              textOff: "Female",
                              textSize: 20,
                              iconOff: Icons.man_4_outlined,
                              iconOn: Icons.man_3_sharp,
                              onTap: () {},
                              onDoubleTap: () {},
                              onSwipe: () {},
                              onChanged: (value) {
                                setState(() {
                                  isMale = value;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Card(
                color: const Color.fromARGB(31, 224, 191, 191),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: ElevatedButton(
                      onPressed: _calculateBmi,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 135, 196, 196),
                        shape: RoundedRectangleBorder(),
                      ),
                      child: iscalculate
                          ? CircularProgressIndicator()
                          : Text("Calculate",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

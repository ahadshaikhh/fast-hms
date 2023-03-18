import 'calculate.dart';
import 'package:flutter/material.dart';
import 'bmi_result.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';
const colour1 = Color(0xFF1D1E33);
const colour2 = Color.fromARGB(255, 7, 22, 43);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int height = 180;
int weight = 54;
int age = 20;

class _InputPageState extends State<InputPage> {
  Color male = colour1;
  Color female = colour1;
  updatecol(int gender) {
    if (gender == 1) {
      if (male == colour1) {
        male = colour2;
        female = colour1;
      } else {
        male == colour1;
      }
    }
    if (gender == 2) {
      if (female == colour1) {
        female = colour2;
        male = colour1;
      } else {
        female == colour1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
            tabBorderRadius: 400,
            tabBackgroundColor: Color.fromARGB(255, 35, 37, 64),
            color: Colors.white,
            activeColor: Colors.white,
            hoverColor: Color.fromARGB(255, 35, 37, 64),
            backgroundColor: Color(0xFF0A0E21),
            tabs: [
              GButton(icon: Icons.person, text: ' Home',
                onPressed: (){
                 Navigator.pop(context);

                },
              ),

              GButton(icon: Icons.logout, text: 'Logout',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  {
                    return homescreen();
                  }));
                },
              )

            ]),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF0A0E21),
          title: Text('BMI CALCULATOR', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Color.fromARGB(255, 17, 23, 56),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updatecol(2);
                        });
                      },
                      child: ReusableCard(
                        colour: female,
                        cardchild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.girl_rounded,
                                  color: Colors.white, size: 100),
                              SizedBox(height: 20),
                              Text('Female',
                                  style: TextStyle(
                                    fontFamily: 'SpectralSC-Regular',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 117, 115, 115),
                                    fontSize: 20,
                                  ))
                            ]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updatecol(1);
                        });
                      },
                      child: ReusableCard(
                        colour: male,
                        cardchild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.man_outlined,
                                  color: Colors.white, size: 100),
                              SizedBox(height: 20),
                              Text('Male',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SpectralSC-Regular',
                                    color: Color.fromARGB(255, 117, 115, 115),
                                    fontSize: 20,
                                  ))
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: colour1,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Height',
                      style: TextStyle(
                        fontFamily: 'SpectralSC-Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 117, 115, 115),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 2),
                        Text('cm',
                            style: TextStyle(
                              fontFamily: 'SpectralSC-Regular',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 117, 115, 115),
                            ))
                      ],
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: SliderThemeData(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20),
                          overlayColor: Colors.red,
                          activeTrackColor: Colors.red,
                          thumbColor: Colors.red,
                          inactiveTrackColor: Colors.black,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 340,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: colour1,
                      cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT',
                                style: TextStyle(
                                  fontFamily: 'SpectralSC-Regular',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 117, 115, 115),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Text(weight.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white)),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                      backgroundColor:
                                          Color.fromARGB(255, 51, 74, 110),
                                      onPressed: () {
                                        setState(() {
                                          weight = weight - 1;
                                        });
                                      },
                                      child: Icon(Icons.remove)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(
                                      backgroundColor:
                                          Color.fromARGB(255, 51, 74, 110),
                                      onPressed: () {
                                        setState(() {
                                          weight = weight + 1;
                                        });
                                      },
                                      child: Icon(Icons.add)),
                                ])
                          ]),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: colour1,
                      cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('AGE',
                                style: TextStyle(
                                  fontFamily: 'SpectralSC-Regular',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 117, 115, 115),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Text(age.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white)),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                      backgroundColor:
                                          Color.fromARGB(255, 51, 74, 110),
                                      onPressed: () {
                                        setState(() {
                                          age = age - 1;
                                        });
                                      },
                                      child: Icon(Icons.remove)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(
                                      backgroundColor:
                                          Color.fromARGB(255, 51, 74, 110),
                                      onPressed: () {
                                        setState(() {
                                          age = age + 1;
                                        });
                                      },
                                      child: Icon(
                                        Icons.add,
                                      )),
                                ])
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: 20000,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  calculator calc = calculator(weight: weight, height: height);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Result(
                        b: calc.calbmi(),
                        w: calc.calbmi2(),
                        y: calc.calbmi3(),
                      );
                    }),
                  );
                },
                child: Text('Calculate',
                    style: TextStyle(
                      fontFamily: 'SpectralSC-Regular',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 243, 240, 240),
                    )),
              ),
            ),
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardchild});

  final Widget? cardchild;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 51, 49, 72),
          width: 3,
        ),
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

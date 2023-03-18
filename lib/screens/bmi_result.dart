import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';
import 'bmi_calculator.dart';

class Result extends StatelessWidget {
  Result({required this.b, required this.w, required this.y});
  final String b;
  final String w;
  final String y;

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
        title: Text('RESULT', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Center(
            child: Text(
              'YOUR RESULT',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: colour1,
            cardchild: Column(children: [
              SizedBox(
                height: 30,
              ),
              Text(
                w,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SpectralSC-Regular',
                ),
              ),
              SizedBox(height: 40),
              Text(
                b,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                y,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SpectralSC-Regular',
                  color: Color.fromARGB(197, 237, 230, 230),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          )),
          Container(
            height: 80,
            width: 20000,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('RE-CALCULATE',
                  style: TextStyle(
                    fontFamily: 'SpectralSC-Regular',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 243, 240, 240),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}

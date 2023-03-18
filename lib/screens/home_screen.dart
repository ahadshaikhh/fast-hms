import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'doctor_bottom_screen.dart';
import 'admin_bottom_screen.dart';
import 'pharmacy_bottom_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'about_screen.dart';
import 'patient_bottom_screen.dart';

class homescreen extends StatelessWidget {
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
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.assignment_outlined,
            text: 'About',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return aboutScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'HOSPITAL MANAGEMENT SYSTEM',
            style: TextStyle(fontFamily: 'Assistant', fontSize: 20),
          ),
        ),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 35, 37, 64),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Lottie.asset('animation/doctor.json'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Are you? ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Assistant',
                    color: Color.fromARGB(255, 99, 102, 147),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BottomScreen(
                  bottom_screen: 'ADMIN',
                  bottom_screen_nav: AdminBottomScreen(),
                ),
                SizedBox(
                  height: 20,
                ),
                BottomScreen(
                  bottom_screen: 'PATIENT',
                  bottom_screen_nav: PatientBottomScreen(),
                ),
                SizedBox(
                  height: 20,
                ),
                BottomScreen(
                  bottom_screen: 'DOCTOR',
                  bottom_screen_nav: DocBottomScreen(),
                ),
                SizedBox(
                  height: 40,
                  child: Divider(
                    height: 2,
                    thickness: 1,
                    color: Color.fromARGB(255, 202, 201, 201),
                  ),
                ),
                BottomScreen(
                  bottom_screen: 'PHARMACY',
                  bottom_screen_nav: PharmBottomScreen(),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomScreen extends StatelessWidget {
  String bottom_screen;
  Widget bottom_screen_nav;

  BottomScreen({required this.bottom_screen, required this.bottom_screen_nav});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => bottom_screen_nav,
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Color.fromARGB(255, 35, 37, 64),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(color: Colors.black),
            ),
          ),
        ),
        child: Text(
          bottom_screen,
          style: TextStyle(
            fontFamily: 'Assistant',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

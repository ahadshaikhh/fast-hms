import 'package:flutter/material.dart';
import 'doctor_registration_screen.dart';
import 'doctor_remove_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';
import 'doctor_list_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: GNav(
          tabBorderRadius: 400,
          tabBackgroundColor: Color.fromARGB(255, 35, 37, 64),
          color: Colors.white,
          activeColor: Colors.white,
          hoverColor: Color.fromARGB(255, 35, 37, 64),
          backgroundColor: Color(0xFF0A0E21),
          tabs: [
            GButton(
              icon: Icons.person,
              text: ' Home',
            ),
            GButton(
              icon: Icons.logout,
              text: 'Logout',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return homescreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
        appBar: AppBar(
          title: Center(child: Text('ADMIN')),
          backgroundColor: Color(0xFF0A0E21),
        ),
        backgroundColor: Color.fromARGB(255, 17, 23, 56),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AdminScreenNav(
                text: 'Register A Doctor',
                navScreen: regdoc(),
              ),
              SizedBox(
                height: 20,
              ),
              AdminScreenNav(
                text: 'Remove A Doctor',
                navScreen: deldoc(),
              ),
              SizedBox(
                height: 20,
              ),
              AdminScreenNav(
                text: 'Doctor Details',
                navScreen: listscreen(),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminScreenNav extends StatelessWidget {
  String text;
  Widget navScreen;

  AdminScreenNav({required this.text, required this.navScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return navScreen;
              },
            ),
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
          text.toUpperCase(),
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

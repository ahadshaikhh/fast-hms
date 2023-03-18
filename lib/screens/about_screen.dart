import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';

class aboutScreen extends StatelessWidget {
  const aboutScreen({super.key});

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
          ),
          GButton(
            icon: Icons.assignment_outlined,
            text: 'About',
          ),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'About Us',
            style: TextStyle(fontFamily: 'Assistant', fontSize: 20),
          ),
        ),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text_Style(
                'Location: ',
                25,
                Color.fromARGB(255, 99, 102, 147),
              ),
              SizedBox(
                height: 20,
              ),
              Text_Style(
                'National Highway Near Shah Latif Town Karachi.',
                20,
                Colors.white,
              ),
              SizedBox(
                height: 40,
              ),
              Text_Style(
                'Pharmacy Locations: ',
                23,
                Color.fromARGB(255, 99, 102, 147),
              ),
              SizedBox(
                height: 20,
              ),
              Text_Style('Clifton Block 8', 20, Colors.white),
              SizedBox(
                height: 5,
              ),
              Text_Style('Defence Phase 8', 20, Colors.white),
              SizedBox(
                height: 5,
              ),
              Text_Style('Shah Latif Town', 20, Colors.white),
              SizedBox(
                height: 40,
              ),
              Text_Style(
                'Contact Us: ',
                25,
                Color.fromARGB(255, 99, 102, 147),
              ),
              SizedBox(
                height: 20,
              ),
              Text_Style('0331-0277446', 20, Colors.white),
              SizedBox(
                height: 5,
              ),
              Text_Style(
                '0335-3188200',
                20,
                Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Text_Style(
                '0332-02755801',
                20,
                Colors.white,
              ),
              SizedBox(
                height: 40,
              ),
              Text_Style(
                'Owners: ',
                25,
                Color.fromARGB(255, 99, 102, 147),
              ),
              SizedBox(
                height: 20,
              ),
              Text_Style(
                'Muhammad Basil Ali Khan',
                20,
                Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Text_Style(
                'Abdul Ahad Shaikh',
                20,
                Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Text_Style(
                'Syed Ali Jodat Naqvi',
                20,
                Colors.white,
              ),
               SizedBox(
                height: 40,
              ),
              Text_Style(
                'Doctors Can Send their CV\'s at: ',
                25,
                Color.fromARGB(255, 99, 102, 147),
              ),
               SizedBox(
                height: 20,
              ),
              Text_Style(
                'fasthms@gmail.com',
                20,
                Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text Text_Style(String text, double size, Color color) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Assistant',
        color: color,
      ),
    );
  }
}

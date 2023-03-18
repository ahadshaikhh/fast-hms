import 'package:fast_hms/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class diet extends StatefulWidget {
  const diet({super.key});

  @override
  State<diet> createState() => _dietState();
}

class _dietState extends State<diet> {
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
        title: Text('SUGGESTED ITEMS'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Symptoms(
                'Cough/Sneeze/Fever: ',
                Color.fromARGB(255, 163, 165, 192),
              ),
              SizedBox(
                height: 30,
              ),
              Symptoms(
                'You are recommended to have Lemon Water with your Breakfast. Don\'t forget the soothing Hot Tea after taking your after-noon Nap!  ',
                Color.fromARGB(255, 99, 102, 147),
              ),
              SizedBox(
                height: 30,
              ),
              Symptoms(
                'Heart Related: ',
                Color.fromARGB(255, 163, 165, 192),
              ),
              SizedBox(
                height: 30,
              ),
              Symptoms(
                'You are recommended to have Boiled Eggs with your Breakfast. Adding Green vegetables and fruit to your diet is a necessity. Avoiding Fats such as Oil and Margarine is highly recommended! ',
                Color.fromARGB(255, 99, 102, 147),
              ),
              SizedBox(height: 30),
              Symptoms(
                'Brain Related: ',
                Color.fromARGB(255, 163, 165, 192),
              ),
              SizedBox(
                height: 30,
              ),
              Symptoms(
                'You are recommended to Add Calcium-rich foods like low-fat and non-fat dairy. Adding Greens and those sweety berries is a plus point! ',
                Color.fromARGB(255, 99, 102, 147),
              ),
              SizedBox(height: 30),
              Symptoms(
                'Skin Related: ',
                Color.fromARGB(255, 163, 165, 192),
              ),
              SizedBox(
                height: 30,
              ),
              Symptoms(
                'Adding that fatty fish such as Salmon to your diet will help heal your skin Faster! Avocados and Walnuts are highly recommended! ',
                Color.fromARGB(255, 99, 102, 147),
              ),
              SizedBox(height: 30),
              Symptoms(
                'Injury: ',
                Color.fromARGB(255, 163, 165, 192),
              ),
              SizedBox(
                height: 30,
              ),
              Symptoms(
                'Apply Iodine to your injury, consult a Doctor ASAP!',
                Color.fromARGB(255, 99, 102, 147),
              ),
              SizedBox(height: 30),
              Symptoms(
                'Eye Related: ',
                Color.fromARGB(255, 163, 165, 192),
              ),
              SizedBox(
                height: 30,
              ),
              Symptoms(
                'Do not rub your eyes at any cost! Add Spinach and tuna in your diet for improving your eyesight. Book Appointment now for further assistance! ',
                Color.fromARGB(255, 99, 102, 147),
              ),
              SizedBox(height: 30),
              Symptoms(
                'Teeth Related: ',
                Color.fromARGB(255, 163, 165, 192),
              ),
              SizedBox(
                height: 30,
              ),
              Symptoms(
                'Don\'t forget to brush your teeth daily to avoid cavities! Cheese is one of the Highly recommended things for healthy teeth! ',
                Color.fromARGB(255, 99, 102, 147),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Text Symptoms(String text, Color color) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 25,
        fontFamily: 'Assistant',
        color: color,
      ),
    );
  }
}

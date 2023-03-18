import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';
import 'update_doctor.dart';
import 'doctor_appointments.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class doctorScreen extends StatefulWidget {
  doctorScreen({Key? key, required this.curr_doc_data}) : super(key: key);
  var curr_doc_data;

  @override
  State<doctorScreen> createState() => _doctorScreenState();
}

class _doctorScreenState extends State<doctorScreen> {
  var size,height,width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return homescreen();
                  }));
                },
              )
            ]),
        appBar: AppBar(
          title: Center(child: Text('Doctor')),
          backgroundColor: Color(0xFF0A0E21),
        ),
        backgroundColor: Color.fromARGB(255, 17, 23, 56),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Greetings Dr.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 92, 101, 158),
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        widget.curr_doc_data[0]['name'].toString(),
                        style: TextStyle(
                            color: Color.fromARGB(255, 92, 101, 158),
                            fontSize: 24),
                      ),
                      Text(
                        '!',
                        style: TextStyle(
                            color: Color.fromARGB(255, 92, 101, 158),
                            fontSize: 24),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return updateDoctor(
                                curr_doc_data: widget.curr_doc_data);
                          }));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 35, 37, 64),
                            ),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: BorderSide(color: Colors.black),
                            ))),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Update Your Information'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Assistant',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        )),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: TextButton(
                        onPressed: () async {
                          bool have_app;
                          var doc_app = await Supabase.instance.client
                              .from('appointments')
                              .select()
                              .match(
                                  {'doctor_id': widget.curr_doc_data[0]['id']});
        
                          if (doc_app.isEmpty) {
                            have_app = false;
                          } else {
                            have_app = true;
                          }
        
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return doctorappointment(
                              curr_doc_data: widget.curr_doc_data,
                              have_appoint: have_app,
                            );
                          }));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 35, 37, 64),
                            ),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: BorderSide(color: Colors.black),
                            ))),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Your Appointments'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'Assistant',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        )),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

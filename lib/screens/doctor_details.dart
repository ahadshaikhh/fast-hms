import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';
import 'admin_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var name;

Future<List<dynamic>> getData (String? docid) async {
  name = await Supabase.instance.client.from('Doctors').select('name,age,specialization,email,gender,password').match({'id':docid});
  // print('In func');
  // print(name);
  return name;
}

class doctordetails extends StatefulWidget {

  doctordetails({Key? key, required this.reqid}):super(key: key);
  String? reqid;

  @override
  State<doctordetails> createState() => _doctordetailsState();
}

class _doctordetailsState extends State<doctordetails> {

  @override
  void initState(){
    super.initState();
    getData(widget.reqid);
  }

  @override
 build(BuildContext context) {

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
              icon: Icons.person,
              text: ' Home',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AdminScreen();
                }));
               
              },
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
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Doctor Details',
            style: TextStyle(fontFamily: 'Assistant', fontSize: 20),
          ),
        ),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: FutureBuilder<List<dynamic>>(
        future: getData(widget.reqid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // while data is loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          }else {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(30),
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  Text(
                    'Name: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Color.fromARGB(255, 99, 102, 147),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text( //add name variable here
                    name[0]['name'].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(

                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Age: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Color.fromARGB(255, 99, 102, 147),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text( //add age.toString() variable here
                    name[0]['age'].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Specialization: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Color.fromARGB(255, 99, 102, 147),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text( //add specilization variable here
                    name[0]['specialization'].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 20,),
                  Text(
                    'Email: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Color.fromARGB(255, 99, 102, 147),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text( //add email variable here
                    name[0]['email'].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Gender: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Color.fromARGB(255, 99, 102, 147),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    name[0]['gender'].toString(), //add gender here
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Password Assigned: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Color.fromARGB(255, 99, 102, 147),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    name[0]['password'].toString(), //add password assigned here
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Assistant',
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
            );
          }
        }
      ),
    );
  }}
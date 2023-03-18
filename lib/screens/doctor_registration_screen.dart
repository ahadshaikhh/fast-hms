import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'admin_screen.dart';
import 'home_screen.dart';

class regdoc extends StatefulWidget {
  @override
  State<regdoc> createState() => _regdocState();
}

class _regdocState extends State<regdoc> {
  final _formKey = GlobalKey<FormState>();
  late String? s1, s2, s3, s4, password, password1;
  late int i1;

  void inputDoctorInfo() async {
    await Supabase.instance.client.from('Doctors').insert(
      {
        'name': s1,
        'age': i1,
        'specialization': s2,
        'email': s3,
        'salary': 10000,
        'gender': s4,
        'password': password1,
        'startingTime':'09:00:00',
        'endingTime' : '17:00:00',
      },
    );
  }

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
                onPressed: () {
                  Navigator.pop(context);
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
          title: Center(child: Text('REGISTERING A DOCTOR')),
          backgroundColor: Color(0xFF0A0E21),
        ),
        backgroundColor: Color.fromARGB(255, 17, 23, 56),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Name: ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Assistant',
                            color: Color.fromARGB(255, 99, 102, 147),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Assistant',
                            color: Colors.white,
                          ),
                          validator: (name) {
                            if (name == '') {
                              return 'Enter a Name!';
                            } else {
                              s1 = name;
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Age: ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Assistant',
                            color: Color.fromARGB(255, 99, 102, 147),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Assistant',
                            color: Colors.white,
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (age) {
                            if (age.toString() == '') {
                              return 'Enter a valid age';
                            } else {
                              i1 = int.parse(age.toString());
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Specialization: ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Assistant',
                            color: Color.fromARGB(255, 99, 102, 147),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Assistant',
                            color: Colors.white,
                          ),
                          validator: (specialization) {
                            if (specialization == '') {
                              return 'Enter a specialization';
                            } else {
                              s2 = specialization;
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Email: ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Assistant',
                            color: Color.fromARGB(255, 99, 102, 147),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Assistant',
                            color: Colors.white,
                          ),
                          validator: (email) {
                            if (!EmailValidator.validate(email.toString())) {
                              return 'Enter a valid Email';
                            } else {
                              s3 = email;
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Gender (M/F) : ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Assistant',
                            color: Color.fromARGB(255, 99, 102, 147),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Assistant',
                            color: Colors.white,
                          ),
                          validator: (gender) {
                            if (gender != 'M' && gender != 'F') {
                              return 'Enter M for Male, F for Female';
                            } else {
                              s4 = gender;
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Password: ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Assistant',
                            color: Color.fromARGB(255, 99, 102, 147),
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Assistant',
                            color: Colors.white,
                          ),
                          validator: (pass) {
                            if (pass == '') {
                              return 'Enter a password';
                            } else {
                              password = pass;
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Confirm Password: ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Assistant',
                            color: Color.fromARGB(255, 99, 102, 147),
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Assistant',
                            color: Colors.white,
                          ),
                          validator: (pass) {
                            if (pass == '') {
                              return 'Enter a Password';
                            } else if (pass != password) {
                              return 'Passwords do not match';
                            } else {
                              password1 = pass;
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextButton(
                            onPressed: () async {
                              String? dialogue_msg;
                              var doEmailexist;
                              if (_formKey.currentState!.validate()) {
                                doEmailexist = await Supabase.instance
                                    .client.from('Doctors').select('id').match(
                                    {'email':s3});
                                if(doEmailexist.isEmpty){
                                  dialogue_msg = 'Data Submitted Successfully';
                                  inputDoctorInfo();
                                }else{
                                  dialogue_msg = 'Email already taken';
                                }
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0))),
                                          backgroundColor:
                                              Color.fromARGB(255, 17, 23, 56),
                                          title: Text(
                                            dialogue_msg.toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                if(doEmailexist.isEmpty){
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                            return AdminScreen();
                                                          }));
                                                }else{
                                                  Navigator.pop(context);
                                                }
                                              },
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ));
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 35, 37, 64),
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  side: BorderSide(color: Colors.black),
                                ))),
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                fontFamily: 'Assistant',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            )),

                        // Add TextFormFields and ElevatedButton here.
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

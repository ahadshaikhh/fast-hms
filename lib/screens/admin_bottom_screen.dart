import 'package:fast_hms/screens/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:email_validator/email_validator.dart';

class AdminBottomScreen extends StatefulWidget {
  const AdminBottomScreen({super.key});

  @override
  State<AdminBottomScreen> createState() => _AdminBottomScreenState();
}

class _AdminBottomScreenState extends State<AdminBottomScreen> {
  final _formKey = GlobalKey<FormState>();
  late String? admin_email;
  late String? admin_pass;
  @override
  Widget build(BuildContext context) {
    bool admin_exist = false;
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        color: Color(0xFF0A0E21),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 17, 23, 56),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text_Style('Email: '),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Assistant',
                          color: Colors.white,
                        ),
                        validator: (email) {
                          if (!EmailValidator.validate(email.toString())) {
                            return 'Enter a valid Email';
                          } else {
                            admin_email = email;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text_Style('Password: '),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Assistant',
                          color: Colors.white,
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == '') {
                            return 'Enter password';
                          } else {
                            admin_pass = value;
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var data;
                            try {
                              data = await Supabase.instance.client
                                  .from('Admin')
                                  .select('email,password')
                                  .match({
                                'password': admin_pass,
                                'email': admin_email,
                              });

                              if (data.isEmpty) {
                                admin_exist = false;
                              } else {
                                admin_exist = true;
                                //print('User exist');
                              }

                            } catch (error) {
                              print(error);
                            }

                            if (admin_exist == false) {
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
                                          'Wrong password',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: ListTile(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    (Radius.circular(20.0))),
                                              ),
                                              title:
                                                  Text('Enter password again '),
                                              trailing:
                                                  Icon(Icons.arrow_forward),
                                              tileColor: Color.fromARGB(
                                                  255, 75, 78, 122),
                                              textColor: Colors.white,
                                              iconColor: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ));
                            } else {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AdminScreen();
                              }));
                            }
                          }
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
                            ),
                          ),
                        ),
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontFamily: 'Assistant',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text Text_Style(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 25,
        fontFamily: 'Assistant',
        color: Color.fromARGB(255, 99, 102, 147),
      ),
    );
  }
}

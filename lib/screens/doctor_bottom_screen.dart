import 'package:fast_hms/screens/doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class DocBottomScreen extends StatefulWidget {
  const DocBottomScreen({super.key});

  @override
  State<DocBottomScreen> createState() => _DocBottomScreenState();
}

class _DocBottomScreenState extends State<DocBottomScreen> {
  final _formKey = GlobalKey<FormState>();
  late String? doc_email;
  late String? doc_pass;

  @override
  Widget build(BuildContext context) {
    bool user_exist;
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
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Assistant',
                              color: Colors.white,
                            ),
                            validator: (email) {
                              if (!EmailValidator.validate(email.toString())) {
                                return 'Enter a valid Email';
                              } else {
                                doc_email = email;
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 10,
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
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Assistant',
                              color: Colors.white,
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == '') {
                                return 'Enter password';
                              }
                              else{
                                doc_pass = value;
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () async {
                                var curr_doc_data;
                                  if (_formKey.currentState!.validate()) {

                                    curr_doc_data = await Supabase.instance.client.from('Doctors').select('id,name,email,password')
                                        .match({'email':doc_email, 'password':doc_pass});
                                    if(curr_doc_data.isEmpty){
                                      //print(data.toString());
                                      //print('User dont exist');
                                      user_exist = false;
                                    }else{
                                      user_exist = true;
                                      //print('User exist');
                                    }

                                    if(user_exist == false){
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
                                                  style:
                                                  TextStyle(color: Colors.white),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: ListTile(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all((Radius.circular(20.0))),
                                                      ),
                                                      title: Text('Enter password again '),
                                                      trailing: Icon(Icons.arrow_forward),
                                                      tileColor: Color.fromARGB(255, 75, 78, 122),
                                                      textColor: Colors.white,
                                                      iconColor: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ));
                                    }else{
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)
                                      {
                                        return doctorScreen(curr_doc_data: curr_doc_data,);
                                      }));
                                    }

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
        ));
  }
}

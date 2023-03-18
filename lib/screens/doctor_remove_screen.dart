import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'admin_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';

class deldoc extends StatefulWidget {
  const deldoc({super.key});

  @override
  State<deldoc> createState() => _deldocState();
}

class _deldocState extends State<deldoc> {
  final _formKey = new GlobalKey<FormState>();
  late String? name, id;
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
          title: Center(child: Text('REMOVING A DOCTOR')),
          backgroundColor: Color(0xFF0A0E21),
        ),
        backgroundColor: Color.fromARGB(255, 17, 23, 56),
        body: Padding(
          padding: const EdgeInsets.all(30),
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
                          validator: (value) {
                            if (value == '')
                            {
                              return 'Enter a valid Name';
                            }else {
                              name = value;
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'DoctorID: ',
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
                          validator: (DoctorID) {
                            if (DoctorID == '') {
                              return 'Enter a valid DoctorID';
                            }
                            id = DoctorID;
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 50,
                        ),
                        TextButton(
                            onPressed: () async {
                              late String dialog_msg;
                              if (_formKey.currentState!.validate()) {

                                var data = await Supabase.instance.client.from('Doctors').select('name,id').match({'name':name, 'id':id});
                                if(data.isEmpty){
                                  dialog_msg = 'No such record exist';
                                }else{
                                  //print(data.toString());
                                  await Supabase.instance.client.from('appointments').delete().match({'doctor_id':id});
                                  var res = await Supabase.instance.client.from('Doctors').delete().match(
                                      {'name':name, 'id':id});
                                  dialog_msg = 'Doctor record removed Successfully';
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
                                            dialog_msg,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                          if(dialog_msg=='No such record exist'){
                                                            return AdminScreen();
                                                          }else{
                                                            return AdminScreen();}
                                                        }));
                                              },
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ));
                              } else {}
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

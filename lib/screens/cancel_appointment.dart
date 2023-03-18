import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class cancelAppointment extends StatefulWidget {
  cancelAppointment({Key? key, required this.curr_pat_data}):super(key: key);
  var curr_pat_data;

  @override
  State<cancelAppointment> createState() => _cancelAppointmentState();
}

class _cancelAppointmentState extends State<cancelAppointment> {
  late String? id;
  final _formKey = new GlobalKey<FormState>();
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
        title: Center(
          child: Text(
            'Cancel Appointment',
            style: TextStyle(fontFamily: 'Assistant', fontSize: 20),
          ),
        ),
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
                        'Appointment ID: ',
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
                        validator: (id1) {
                          if (id1 == '')
                          {
                            return 'Enter a valid Appointment ID';
                          }else {
                            id = id1;
                            return null;
                          }
                        },
                      ),

                      SizedBox(
                        height: 50,
                      ),
                      TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              late String dialog_msg;
                              final List pat_app = await Supabase.instance.client.from('appointments').select('id').match(
                                  {'patient_id':widget.curr_pat_data[0]['p_id'], 'id': id});

                              if(pat_app.isEmpty){
                                dialog_msg = 'No appointment found with this appointment ID';
                              }else{
                                print(widget.curr_pat_data[0]['p_id']);
                                dialog_msg = 'Appointment cancelled succefully!';
                                await Supabase.instance.client.from('appointments').delete().match(
                                    {'patient_id':widget.curr_pat_data[0]['p_id'], 'id': id});
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
                                        title: Text( dialog_msg,
                                          style:
                                          TextStyle(color: Colors.white),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
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
    );
  }
}
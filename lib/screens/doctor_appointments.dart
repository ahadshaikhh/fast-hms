import 'package:fast_hms/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class doctorappointment extends StatefulWidget {
  doctorappointment({Key? key, required this.curr_doc_data, required this.have_appoint}):super(key: key);
  var curr_doc_data;
  bool have_appoint;

  @override
  State<doctorappointment> createState() => _doctorappointmentState();
}

class _doctorappointmentState extends State<doctorappointment> {
  @override
  Widget build(BuildContext context) {
    final messageStream = Supabase.instance.client
        .from('appointments')
        .stream(primaryKey: ['id'])
        .eq('doctor_id', widget.curr_doc_data[0]['id']);

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
        title: Center(
          child: Text(
            'Your Appointments',
            style: TextStyle(fontFamily: 'Assistant', fontSize: 20),
          ),
        ),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),


      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: messageStream,
              builder: ((context, snapshot) {
                if(widget.have_appoint==false){
                  return Center(
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20.0))),
                      backgroundColor:
                      Color.fromARGB(255, 17, 23, 56),
                      title: Text( 'No Appointments found!',
                        style:
                        TextStyle(color: Colors.white),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  );
                }
                if(snapshot.connectionState != ConnectionState.active) {// when no data exist in table
                  return Center(child: Column(
                    children: [
                      SizedBox(height: 20,),
                      CircularProgressIndicator(),
                    ],
                  ));
                }

                final messages = snapshot.data!;
                return Scrollbar(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: ((context,index){
                      return Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 63, 67, 147),
                            border: Border.all(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Appointment ID : ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Assistant',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    messages[index]['id'].toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Assistant',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(
                                    'Patient Name : ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Assistant',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    messages[index]['patient_name'],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Assistant',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Text(
                                    'Appointment Date : ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Assistant',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    messages[index]['appoint_date'],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Assistant',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text(
                                    'Appointment Time : ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Assistant',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    messages[index]['start_time'] + ' - ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Assistant',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    messages[index]['end_time'],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Assistant',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                );

              }),
            ),
          ),
        ],
      ),
    );
  }
}

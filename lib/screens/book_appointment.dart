import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';

var doc_data;
late List suit_doc_data;
late String app_date;
late int rand_doc;

class bookappointment extends StatefulWidget {
  bookappointment({Key? key, required this.curr_pat_data}):super(key: key);
  var curr_pat_data;

  @override
  State<bookappointment> createState() => _bookappointmentState();
}

class _bookappointmentState extends State<bookappointment> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  String symptoms = 'Not Sure';
  String time_slot = '09:00:00 - 10:00:00';

  // List of items in our dropdown menu
  var sym_list = [
    'Not Sure',
    'Cough, Sneeze, Fever',
    'Heart Related',
    'Brain Related',
    'Skin Related',
    'Injured',
    'Eye Related',
    'Teeth Related',
  ];
  var slot_list = [
    '09:00:00 - 10:00:00',
    '10:00:00 - 11:00:00',
    '11:00:00 - 12:00:00',
    '12:00:00 - 13:00:00',
    '13:00:00 - 14:00:00',
    '14:00:00 - 15:00:00',
    '15:00:00 - 16:00:00',
    '16:00:00 - 17:00:00',
  ];
  // start time saved in startTime[randnum.toString()]
  // start time saved in endTime[randnum.toString()]

  Future<void> suitable_doc(String sym) async {
    try{
      print('In func');
      print(sym);
      
      if(sym == 'Heart Related'){
        doc_data = await Supabase.instance.client.from('Doctors').select('name,id,specialization',const FetchOptions(
          count: CountOption.exact,
        ),).match({'specialization':'Heart Specialist'});
        suit_doc_data = await Supabase.instance.client.from('Doctors').select('name,id,specialization').match({'specialization':'Heart Specialist'});
      }

      else if(sym.toString() == 'Brain Related'){
        doc_data = await Supabase.instance.client.from('Doctors').select('specialization',const FetchOptions(
          count: CountOption.exact,
        ),).match({'specialization':'Neurologist'});
        suit_doc_data = await Supabase.instance.client.from('Doctors').select('name,id,specialization').match({'specialization':'Neurologist'});
      }

      else if(sym == 'Skin Related'){
        doc_data = await Supabase.instance.client.from('Doctors').select('specialization',const FetchOptions(
          count: CountOption.exact,
        ),).match({'specialization':'Skin specialist'});
        suit_doc_data = await Supabase.instance.client.from('Doctors').select('name,id,specialization').match({'specialization':'Skin specialist'});
      }

      else if(sym == 'Injured'){
        doc_data = await Supabase.instance.client.from('Doctors').select('specialization',const FetchOptions(
          count: CountOption.exact,
        ),).match({'specialization':'Orthopedic'});
        suit_doc_data = await Supabase.instance.client.from('Doctors').select('name,id,specialization').match({'specialization':'Orthopedic'});
      }

      else if(sym == 'Eye Related'){
        doc_data = await Supabase.instance.client.from('Doctors').select('specialization',const FetchOptions(
          count: CountOption.exact,
        ),).match({'specialization':'Eye specialist'});
        suit_doc_data = await Supabase.instance.client.from('Doctors').select('name,id,specialization').match({'specialization':'Eye specialist'});
      }

      else if(sym == 'Teeth Related'){
        doc_data = await Supabase.instance.client.from('Doctors').select('specialization',const FetchOptions(
          count: CountOption.exact,
        ),).match({'specialization':'Dentist'});
        suit_doc_data = await Supabase.instance.client.from('Doctors').select('name,id,specialization').match({'specialization':'Dentist'});
      }

      else if(sym == 'Not Sure' || sym == 'Cough, Sneeze, Fever'){
        doc_data = await Supabase.instance.client.from('Doctors').select('specialization',const FetchOptions(
          count: CountOption.exact,
        ),).match({'specialization':'General physician'});
        suit_doc_data = await Supabase.instance.client.from('Doctors').select('name,id,specialization').match({'specialization':'General physician'});
      }
      print(suit_doc_data);

      if(suit_doc_data.isEmpty){
        doc_data = await Supabase.instance.client.from('Doctors').select('specialization',const FetchOptions(
          count: CountOption.exact,
        ),).match({'specialization':'General physician'});
        suit_doc_data = await Supabase.instance.client.from('Doctors').select('name,id,specialization').match({'specialization':'General physician'});
      }

    }catch(error){
      print(error);
    }

  }

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
        title: Text('Book Your Appointment'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Name: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Assistant',
                        color: Colors.white
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.curr_pat_data[0]['name'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Assistant',
                        color: Color.fromARGB(255, 99, 102, 147),
                      ),
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
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.curr_pat_data[0]['age'].toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Assistant',
                        color: Color.fromARGB(255, 99, 102, 147),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Symptoms: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Assistant',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                      disabledHint: Text('Select symptoms'),
                      // Initial Value
                      value: symptoms,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),

                      // Array list of items
                      items: sym_list.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items,
                            style: TextStyle(color: Color.fromARGB(255, 150, 157, 207),
                                fontSize: 20),),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (newValue) {
                        setState(() {
                          symptoms = newValue.toString();
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Time Slot: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Assistant',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                      disabledHint: Text('Select time slot'),
                      // Initial Value
                      value: time_slot,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                      ),

                      // Array list of items
                      items: slot_list.map(( i) {
                        return DropdownMenuItem(
                          value: i,
                          child: Text(i,
                            style: TextStyle(color: Color.fromARGB(255, 150, 157, 207),
                                fontSize: 20),),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: ( newValue) {
                        setState(() {
                          time_slot = newValue!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: dateinput, //editing controller of this TextField
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        fillColor: Colors.black,
                          icon: Icon(Icons.calendar_today,
                          color: Colors.white,), //icon of text field
                          labelText: "Select appointment date", //label text of field

                      ),
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Assistant',
                        color: Color.fromARGB(255, 99, 102, 147),
                      ),
                      readOnly: true,  //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context, initialDate: DateTime.now(),
                            firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(DateTime.now().year+1),
                        );

                        if(pickedDate != null ){
                          print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
                          app_date = formattedDate;//formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            dateinput.text = formattedDate; //set output date to TextField value.
                          });
                        }else{
                          pickedDate = DateTime.now();
                          
                          
                          print("Current Date is selected");

                        }
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextButton(
                        onPressed: () async {
                          print('Before funv call');
                          print(symptoms);
                          await suitable_doc(symptoms);

                          rand_doc = Random().nextInt(doc_data.count);
                          print(suit_doc_data);
                            try{
                              var res = await Supabase.instance.client.from('appointments').insert({
                                'patient_id': widget.curr_pat_data[0]['p_id'],
                                'patient_name':widget.curr_pat_data[0]['name'],
                                'doctor_id': suit_doc_data[rand_doc]['id'],
                                'doctor_name' : suit_doc_data[rand_doc]['name'].toString(),
                                'start_time': time_slot.substring(0,7),
                                'end_time': time_slot.substring(11,18),
                                'appoint_date': app_date,
                                'symptoms': symptoms,
                              });
                            }catch(e){
                              Navigator.pop(context);
                            }
                            print(symptoms);
                            
                            var appoint_data = await Supabase.instance.client.from('appointments').select('id').order('id',ascending: false).limit(1);
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
                                        'Appointment booked Successfully',
                                        style: TextStyle(color: Colors.white,
                                        fontSize: 22),
                                      ),
                                      content: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Doctor: ',
                                                style:
                                                TextStyle(color: Color.fromARGB(255, 163, 190, 224),
                                                    fontSize: 25),
                                              ),
                                              Text(suit_doc_data[rand_doc]['name'],
                                                style:
                                                TextStyle(color: Colors.white,
                                                    fontSize: 25),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20,),
                                          Text('Timing: ',
                                            style:
                                            TextStyle(color:Color.fromARGB(255, 163, 190, 224),
                                                fontSize: 25),),

                                          Text(time_slot,
                                            style:
                                            TextStyle(color:Colors.white,
                                                fontSize: 25),),
                                          SizedBox(height: 80,),

                                          Card(
                                            elevation: 50,
                                            shadowColor: Colors.black,
                                            color: Colors.black38,
                                            child: SizedBox(
                                              width: 150,
                                              height: 230,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Text('Appointment ID: ',
                                                      style:
                                                      TextStyle(color: Color.fromARGB(
                                                          255, 23, 74, 148),
                                                          fontSize: 30),),
                                                    SizedBox(height: 20,),
                                                    Text(appoint_data[0]['id'].toString(),
                                                      style:
                                                      TextStyle(color: Color.fromARGB(
                                                          255, 231, 130, 67),
                                                          fontSize: 100),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 60,),
                                          Text('Note down the appointment id',
                                            style:
                                            TextStyle(color: Colors.red,
                                                fontSize: 20),),
                                        ],
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
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
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
              ]),
        ),
      ),
    );
  }
}
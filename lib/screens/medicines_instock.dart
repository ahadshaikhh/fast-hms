import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class medinstock extends StatefulWidget {
  const medinstock({super.key});

  @override
  State<medinstock> createState() => _medinstockState();
}

class _medinstockState extends State<medinstock> {
  @override
  Widget build(BuildContext context) {
    final medStream = Supabase.instance.client.from('medicines').stream(primaryKey: ['id']);

    print(medStream);
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
              icon: Icons.home,
              text: 'Home',
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
        title: Text('MEDICINES IN STOCK'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Expanded(
          child: StreamBuilder(
            stream: medStream,
            builder: ((context, snapshot) {
              if(snapshot.connectionState != ConnectionState.active) // when no data exist in table
                return Center(child: CircularProgressIndicator());

              final med_data = snapshot.data!;
              return Scrollbar(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: med_data.length,
                  itemBuilder: ((context,index){
                    return ListTile(
                      title: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              med_data[index]['name'],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Assistant',
                                color: Color.fromARGB(255, 99, 102, 147),
                              ),
                            ),
                            SizedBox(width: 60,),
                            Text(
                              med_data[index]['quantity'].toString(), //enter stock here
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Assistant',
                                color: Color.fromARGB(255, 99, 102, 147),
                              ),
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
      ),
    );
  }
}
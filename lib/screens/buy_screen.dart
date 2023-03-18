import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'about_screen.dart';
import 'token_screen.dart';
import 'dart:math';

class BuyScreen extends StatefulWidget {
  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  int panadol = 0,
      calpol = 0,
      nexum = 0,
      Augmentin = 0,
      Methycobal = 0,
      brufen = 0,
      citanew = 0,
      flagyl = 0,
      strepsills = 0,
      norvasac = 0,
      flag=0;

  @override
  Widget build(BuildContext context) {
    List<String> medicines_bought = ['norvasac','panadol','augmentin','nexum','methycobal','citanew','flagyl','strepsills','brufen','calpol'];
    List<int> medicines_quantity = [];

    var textStyle = TextStyle(
        color: Color.fromARGB(255, 99, 102, 147),
        fontSize: 25,
        fontFamily: 'Assistant',
        fontWeight: FontWeight.bold);
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
            ),
            GButton(
              icon: Icons.assignment_outlined,
              text: 'About',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return aboutScreen();
                }));
              },
            ),
          ]),
      appBar: AppBar(
        title: Text(
          'BUY',
        ),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 56),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  InkWell(
                    child: Buy_Icon(icon: Icons.remove),
                    onTap: () {
                      setState(
                        () {
                          if (panadol == 0) {
                            panadol = 0;
                          } else {
                            panadol--;
                          }
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Buy_Icon(icon: Icons.add),
                    onTap: () {
                      setState(
                        () {
                          panadol++;
                          flag=1;
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Panadol',
                    style: textStyle,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    panadol.toString(),
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  InkWell(
                    child: Buy_Icon(icon: Icons.remove),
                    onTap: () {
                      setState(
                        () {
                          if (calpol == 0) {
                            calpol = 0;
                          } else {
                            calpol--;
                          }
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Buy_Icon(icon: Icons.add),
                    onTap: () {
                      setState(
                        () {
                          calpol++;
                          flag=1;
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Calpol',
                    style: textStyle,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    calpol.toString(),
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  InkWell(
                    child: Buy_Icon(icon: Icons.remove),
                    onTap: () {
                      setState(
                        () {
                          if (Augmentin == 0) {
                            Augmentin = 0;
                          } else {
                            Augmentin--;
                          }
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Buy_Icon(icon: Icons.add),
                    onTap: () {
                      setState(
                        () {
                          Augmentin++;
                          flag=1;
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Augmentin',
                    style: textStyle,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    Augmentin.toString(),
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  InkWell(
                    child: Buy_Icon(icon: Icons.remove),
                    onTap: () {
                      setState(
                        () {
                          if (nexum == 0) {
                            nexum = 0;
                          } else {
                            nexum--;
                          }
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Buy_Icon(icon: Icons.add),
                    onTap: () {
                      setState(
                        () {
                          nexum++;
                          flag=1;
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Nexum',
                    style: textStyle,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    nexum.toString(),
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  InkWell(
                    child: Buy_Icon(icon: Icons.remove),
                    onTap: () {
                      setState(
                        () {
                          if (Methycobal == 0) {
                            Methycobal = 0;
                          } else {
                            Methycobal--;
                          }
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Buy_Icon(icon: Icons.add),
                    onTap: () {
                      setState(
                        () {
                          Methycobal++;
                          flag=1;
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Methycobal',
                    style: textStyle,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    Methycobal.toString(),
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  InkWell(
                    child: Buy_Icon(icon: Icons.remove),
                    onTap: () {
                      setState(
                        () {
                          if (brufen == 0) {
                            brufen = 0;
                          } else {
                            brufen--;
                          }
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Buy_Icon(icon: Icons.add),
                    onTap: () {
                      setState(
                        () {
                          brufen++;
                          flag=1;
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Brufen',
                    style: textStyle,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    brufen.toString(),
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  InkWell(
                    child: Buy_Icon(icon: Icons.remove),
                    onTap: () {
                      setState(
                        () {
                          if (citanew == 0) {
                            citanew = 0;
                          } else {
                            citanew--;
                          }
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Buy_Icon(icon: Icons.add),
                    onTap: () {
                      setState(
                        () {
                          citanew++;
                          flag=1;
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Citanew',
                    style: textStyle,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    citanew.toString(),
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  InkWell(
                    child: Buy_Icon(icon: Icons.remove),
                    onTap: () {
                      setState(
                        () {
                          if (flagyl == 0) {
                            flagyl = 0;
                          } else {
                            flagyl--;
                          }
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Buy_Icon(icon: Icons.add),
                    onTap: () {
                      setState(
                        () {
                          flagyl++;
                          flag=1;
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Flagyl',
                    style: textStyle,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    flagyl.toString(),
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  InkWell(
                    child: Buy_Icon(icon: Icons.remove),
                    onTap: () {
                      setState(
                        () {
                          if (strepsills == 0) {
                            strepsills = 0;
                          } else {
                            strepsills--;
                          }
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Buy_Icon(icon: Icons.add),
                    onTap: () {
                      setState(
                        () {
                          strepsills++;
                          flag=1;
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Strepsills',
                    style: textStyle,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    strepsills.toString(),
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  InkWell(
                    child: Buy_Icon(icon: Icons.remove),
                    onTap: () {
                      setState(
                        () {
                          if (norvasac == 0) {
                            norvasac = 0;
                          } else {
                            norvasac--;
                          }
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Buy_Icon(icon: Icons.add),
                    onTap: () {
                      setState(
                        () {
                          norvasac++;
                          flag=1;
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Norvasac',
                    style: textStyle,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    norvasac.toString(),
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '* Note:  Adding 1 means adding 1 to total no of tablets. ',
                style: TextStyle(
                  fontFamily: 'Assistant',
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                     if(panadol==0 && calpol==0 && citanew==0 && brufen==0 && strepsills==0 && norvasac==0 && Methycobal==0 && flagyl==0 && nexum==0 && Augmentin==0)
                     {

                     }else
                     {
                       medicines_quantity = [norvasac,panadol,Augmentin,nexum,Methycobal,citanew,flagyl,strepsills,brufen,calpol];
                       var randnum = Random();
                       int token_no = randnum.nextInt(10000);
                       
                       await Supabase.instance.client.from('tokens').insert(
                           {'id':token_no,'medicines':medicines_bought,'quantity':medicines_quantity});
                       
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return tokenscreen(token_no:token_no);
                          },
                        ),
                      );
                     }
                     
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 35, 37, 64),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(58),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    label: Text(
                      'Buy',
                      style: TextStyle(
                        fontFamily: 'Assistant',
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Buy_Icon extends StatelessWidget {
  IconData icon;

  Buy_Icon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        color: Colors.white,
        size: 50,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromARGB(255, 35, 37, 64),
          border: Border.all(width: 2)),
    );
  }
}

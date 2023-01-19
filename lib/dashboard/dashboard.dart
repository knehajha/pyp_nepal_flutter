import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.amber,
        actions: <Widget>[
          // Using Stack to show Notification Badge
          Stack(
            children: <Widget>[
              IconButton(icon: const Icon(Icons.notifications), onPressed: () {
                setState(() {
                  counter = 0;
                });
              }),
              counter != 0 ? Positioned(
                right: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ) : Container()
            ],
          ),
        ],
      ),



      drawer: Drawer( //??
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffFFBF62)
              ),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding( padding: const EdgeInsets.only(top:60, right: 50,left:10),
                //padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(alignment: Alignment.topLeft,
                      child: Padding(padding: const EdgeInsets.only(left:20),
                        child: Text(
                          'Account',
                          style: GoogleFonts.montserrat(
                            //  textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,),
                        ),
                      ),
                    ),
                    const SizedBox(height:20),
                    ListTile(
                      leading: const Icon(Icons.notifications, color:  Color(0xffFFBF62)),
                      title: const Text(' Notifications '),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.calendar_today, color: Color(0xffFFBF62)),
                      title: const Text(' Attendance '),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.one_k, color:  Color(0xffFFBF62),),
                      title: const Text(' My Classes '),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.money, color:  Color(0xffFFBF62),),
                      title: const Text(' Donation '),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.local_activity, color: Color(0xffFFBF62),),
                      title: const Text(' Activities '),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading:const Icon(
                        Icons.settings,
                        color:  Color(0xffFFBF62),
                      ),
                      title: const Text('Setting'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.place_sharp, color:  Color(0xffFFBF62),),
                      title: const Text('Addresses'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                 const SizedBox(height: 40),
                 Align(alignment: Alignment.topLeft,
                 child: Padding(padding: const EdgeInsets.only(left:20),
                 child:
                    Text(
                      'Follow us',
                      style: GoogleFonts.montserrat(
                        //  textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,),
                    ),
                 ),
                 ),
                    const SizedBox(height: 35),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.whatsapp_rounded,color: Colors.green,),
                            onPressed:(){
                             // launchUrl();
                            }
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: const Icon(Icons.facebook_rounded,color: Colors.blue,),
                          onPressed:(){
                            // launchUrl();
                          }
                        ),
                        const SizedBox(width: 10),

                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),


      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 50),
          ],


        ),
      ),
    );
  }


  }


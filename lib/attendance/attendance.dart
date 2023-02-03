import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {

  String dropDownValue = "";

  final List<String> _DropdownList = [
    "Yoga Class",
    'Patanjali Yog Committee, Nepal',
    'Mahila Patanjali Yog Committee, Nepal',
    "Yuva Nepal Samiti",
    'None'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("My Attendance"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Text(
        'January, 2023',
        style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 10,),
                  Image.asset("assets/images/attendance.png",width:22,height: 22,color: Colors.white,),
                ],
              ),
            ),

          ]
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: DropdownButtonFormField(
              isExpanded: true,
              itemHeight: null,
              decoration: InputDecoration(
                fillColor: const Color(0xffF5F5F5),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),

                ),
                hintText: 'Yoga Class',
                 prefixIcon: const Padding(
                   padding: EdgeInsets.all(8.0),
                   child: ImageIcon(AssetImage("assets/images/all_classes.png"), size: 15, color: Color(0xff464646)),
                 ),
              ),
              dropdownColor: Colors.white,
              value: dropDownValue.isEmpty ? _DropdownList[0] : dropDownValue,
              onChanged: (newValue) {
                setState(() {
                  dropDownValue = newValue.toString();
                });
              },
              items: _DropdownList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(fontSize: 16, ),
                  ),
                );
              }).toList(),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Row(
            children:  [
              const Image(
                image: AssetImage("assets/images/progressbar.png"),
                height: 100,
                width: 100,
              ),
              const SizedBox(width: 40,),

              Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 20,),
                Text(
                  'Attendance',
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),

                Text(
                  '25%',
                  style: GoogleFonts.montserrat(
                      color: ( const Color(0xff464646)),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ],
          ),
        ),

          const SizedBox(height: 18,),
          Padding(
            padding: const EdgeInsets.only(bottom:15,left: 15,right: 15),
            child: Container(
              color: const Color(0xffF5F5F5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Date", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                  Text("Punch In", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                  Text("Punch Out", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                  Text("Punch Type", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),

                ],),
            ),
          ),

          Flexible(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index,) {
                return Container(
                  color: (index % 2 == 0) ?const Color(0xffFFFFFF) : const Color(0xffF5F5F5),

                  child: ListTile(
                    subtitle:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("12/01/2023", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),
                        Text("08:30 A.M.", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),
                        Text("6.06 P.M.", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),
                        Text("Self", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),

                      ],),


                  ),
                );
              },
            ),
          )


        ],

      ),

    );
  }
}

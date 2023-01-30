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
            IconButton(
                icon: const Icon(Icons.calendar_month_sharp),
                onPressed: () {
                  setState(() {});
                }),
          ]
      ),
      body: Padding(
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

    );
  }
}

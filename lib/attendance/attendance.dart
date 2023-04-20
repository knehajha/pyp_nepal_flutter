import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pyp_nepal/network/model/fetchClass.dart';
import 'package:pyp_nepal/util/progress_dialog.dart';

import '../network/Api_client.dart';
import '../network/Api_response.dart';
import '../network/model/atdScoreModel.dart';
import '../network/model/monthAtdModel.dart';
import '../util/date_util.dart';
import '../util/uiUtil.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key, required this.myClasses}) : super(key: key);

  final List<FetchClassModel> myClasses;

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {



  FetchClassModel? selectedClass = null;

   // final _dateController;
  String selectedDate = "";
  String promptDate = "";
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      promptDate = DateFormat('MMMM-yyyy').format(picked);
      print(formattedDate);
      setState(() {
        selectedDate = formattedDate;
        _getMonthAtdScore(selectedClass?.id?? "", selectedDate);
        _getMyAtd();
      });
    }
  }



  List<MonthAtdModel> mAtds = [];


  AtdScoreModel? monClassAtt ;
  _getMonthAtdScore(String classId, String date) async {
    ApiResponse response = await getAtdScore(classId,date);
    if(response.isSuccess){
      setState(() {
        monClassAtt = response.result;
      });
    }else{
      showToast(response.message);
    }
  }

  _getMyAtd() async {
    if(selectedClass != null && selectedDate.isNotEmpty){
      String classId = selectedClass!.id;
      ApiResponse response  = await monthlyAttendance(classId, selectedDate);
      if(response.isSuccess){
        setState(() {
          mAtds = response.result;
        });
      } else{
        showToast(response.message);
      }
    }

  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    promptDate = DateFormat('MMMM-yyyy').format(DateTime.now());
    selectedClass = this.widget.myClasses[0];

    setState(() {
      _getMonthAtdScore(selectedClass?.id?? "", "");
      _getMyAtd();
    });

  }



  SvgPicture _getAttMeter(int att){
    String url = "assets/images/p_0.svg";
   if(att > 0 && att <= 20){
      url = "assets/images/p_20.svg";
    }else if(att > 20 && att <= 40){
      url = "assets/images/p_40.svg";
    }else if(att == 50){
     url = "assets/images/p_50.svg";
   }else if(att > 40 && att <= 60){
      url = "assets/images/p_60.svg";
    }else if(att > 60 && att <= 80){
      url = "assets/images/p_80.svg";
    }else if(att > 80 && att <= 100){
      url = "assets/images/p_100.svg";
    }

    return SvgPicture.asset(url,height:100, width: 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("My Attendance"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Text(promptDate, style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector( onTap: (){
                    _selectDate(context);
                  },
                      child: Image.asset("assets/images/attendance.png",width:22,height: 22,color: Colors.white,)),

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
              value: selectedClass == null ? this.widget.myClasses[0] : selectedClass,
              onChanged: (newValue) {
                setState(() {
                  selectedClass = (newValue as FetchClassModel);
                  _getMonthAtdScore(selectedClass?.id?? "", selectedDate);
                  _getMyAtd();
                });
              },
              items: this.widget.myClasses.map<DropdownMenuItem<FetchClassModel>>((FetchClassModel value) {
                return DropdownMenuItem<FetchClassModel>(
                  value: value,
                  child: Text(
                    value.name,
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
              // _getAttMeter(40),
              _getAttMeter(monClassAtt?.result == null ? 0 : monClassAtt?.result.toInt()??0),
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
                  '${monClassAtt?.result == null ? "0" : monClassAtt?.result.toInt()}%',
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
          Container(
              height: 60,
            color: const Color(0xffF5F5F5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Row(
                children: [
                  Expanded(

                      child: Text("Date", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,)),
                  Expanded(
                      child: Text("Punch In", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,)),
                  Expanded(
                      child: Text("Punch Out", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,)),
                  Expanded(
                      child: Text("Punch Type", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,)),
                ],),
            ),
          ),


          Flexible(
            child: mAtds.isEmpty ? Padding(
              padding: const EdgeInsets.only(top:28.0),
              child: Text("Attendance record not found"),
            ) : ListView.builder(
              itemCount: mAtds.length,
              itemBuilder: (BuildContext context, int index,) {
                return Container(
                  color: (index % 2 == 0) ?const Color(0xffFFFFFF) : const Color(0xffF5F5F5),
                  child: ListTile(
                    subtitle:
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("${mAtds[index].punchDate}", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,)),
                          Expanded(child: Text("${parseDate(mAtds[index].punchIn)}", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,)),
                          Expanded(child: Text("${parseDate(mAtds[index].punchOut)}", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,)),
                          Expanded(child: Text("Self", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,)),

                        ],),
                    ),


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

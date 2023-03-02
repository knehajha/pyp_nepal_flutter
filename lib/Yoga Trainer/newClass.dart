import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io' show Platform;
import 'package:pyp_nepal/Yoga%20Trainer/trainerHome.dart';

class NewClass extends StatefulWidget {
  const NewClass({Key? key}) : super(key: key);

  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass>{


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      print(formattedDate);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  Future<void> displayTimeDialog(int type) async {
    final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      builder: (context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (time != null) {
      setState(() {
        print("selected time=${time.format(context)}");
        if(type == 0){
          _startTimeController.text = time.format(context);
        }else{
          _endTimeController.text = time.format(context);
        }

      });
    }
  }


  final _dateController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _addressController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Class",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
          child: Column(
            children: [
              TextField(
                style: GoogleFonts.poppins(),
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: SvgPicture.asset("assets/images/my_classes.svg",color: Colors.black45,height: 22,width: 22,),
                    onPressed:() {}
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                 labelText: 'Class Name',
                  hintStyle: const TextStyle(color: Color(0xff000000)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                style: GoogleFonts.poppins(),
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person,size: 23,),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  labelText: 'Yoga Trainer Name',
                  hintStyle: const TextStyle(color: Color(0xff000000)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
              controller: _dateController,
                style: GoogleFonts.poppins(),
                obscureText: false,
                readOnly: true,
                enableSuggestions: false,
                autocorrect: false,

                decoration: InputDecoration(
                  prefixIcon: IconButton(

                    icon: SvgPicture.asset("assets/images/calendar-4.svg",height: 19,width: 19,),
                    onPressed:() => _selectDate(context),
                  ),
                  labelText: 'Establish date',
                  hintText: "dd-mm-yyyy",

                  hintStyle: const TextStyle(color: Color(0xff000000)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _startTimeController,
                style: GoogleFonts.poppins(),
                readOnly: true,
                obscureText: false,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  prefixIcon: IconButton(

                      icon: SvgPicture.asset("assets/images/clock-2.svg",height: 20,width: 20,),
                      onPressed: (){
                        displayTimeDialog(0);
                      }
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  labelText: 'Start Time',
                  hintStyle: const TextStyle(color: Color(0xff000000)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _endTimeController,
                style: GoogleFonts.poppins(),
                readOnly: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  prefixIcon: IconButton(

                    icon: SvgPicture.asset("assets/images/clock-2.svg",height: 20,width: 20,),
                    onPressed:  (){
                      displayTimeDialog(1);
                    }
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  labelText: 'End Time',
                  hintStyle: const TextStyle(color: Color(0xff000000)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _addressController,
                style: GoogleFonts.poppins(),
                enableSuggestions: false,
                autocorrect: false,
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon: IconButton(

                    icon: SvgPicture.asset("assets/images/location.svg",height: 20,width: 20,),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlacePicker(
                              apiKey: Platform.isAndroid
                                  ? "AIzaSyALJLuC14twQ7K3SwCl-1bySfjeGH7_vWI"
                                  : "YOUR IOS API KEY",
                              onPlacePicked: (result) {
                        print("picked format Address=${result.formattedAddress}");
                        print("picked Address lat-lon=${result.geometry?.location.lat}-${result.geometry?.location.lng}");
                        Navigator.of(context).pop();
                        setState(() {
                          _addressController.text=result.formattedAddress.toString();
                        });
                        },
                          initialPosition: LatLng(29.907091,77.9986938),
                          useCurrentLocation: true,
                          resizeToAvoidBottomInset: false, // only works in page mode, less flickery, remove if wrong offsets
                        ),
                      ),
                      );
                    },
                  ),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  labelText: 'Location',
                  hintStyle: const TextStyle(color: Color(0xff000000)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(

               // style: const TextStyle(height: 7.0,),
                style: GoogleFonts.poppins(),
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                enableSuggestions: false,
                autocorrect: false,
                maxLines: 7,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  labelText: 'Description',
                  hintStyle: const TextStyle(color: Color(0xff000000)),

                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        primary: const Color(0XFF0E132F),
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        "REGISTER",
                        style: GoogleFonts.montserrat(color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () =>
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) => const TrainerHome(),


                          ))),

                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:collection';
import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io' show Platform;

import 'package:pyp_nepal/network/model/fetchClass.dart';

import '../network/Api_client.dart';
import '../network/Api_response.dart';
import '../util/uiUtil.dart';
import '../util/widgetUtil.dart';



class UpdateClass extends StatefulWidget {
  const UpdateClass({Key? key, required this.fm,}) : super(key: key);

 final FetchClassModel fm;

  @override
  State<UpdateClass> createState() => _UpdateClassState();
}


class _UpdateClassState extends State<UpdateClass> {


  final _formKey = GlobalKey<FormState>();

  final classNameController = TextEditingController();
  final trainerNameController = TextEditingController();
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final createPassController = TextEditingController();


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
        this.widget.fm.establishDate = formattedDate;
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
         this.widget.fm.startTime = _startTimeController.text;
        }else{
          _endTimeController.text = time.format(context);
       this.widget.fm.endTime = _endTimeController.text;
        }

      });
    }
  }
  final _dateController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    classNameController.text = this.widget.fm.name;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Class",
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    this.widget.fm.name = value;
                  },
                  controller: classNameController,
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
                    hintText: "${this.widget.fm.name}",
                    hintStyle: const TextStyle(color: Color(0xff000000)),

                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(

                  onChanged: (value) {
                    this.widget.fm.trainerName = value;
                  },
                  controller: trainerNameController,
                  style: GoogleFonts.poppins(),
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person,size: 23,),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    hintText:"${this.widget.fm.trainerName}",
                    hintStyle: const TextStyle(color: Color(0xff000000)),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: (value) {
                    this.widget.fm.establishDate = value;
                  },
                  controller: _dateController,
                  onTap: () {
                    _selectDate(context);
                  },

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
                    hintText:"${this.widget.fm.establishDate}",

                    hintStyle: const TextStyle(color: Color(0xff000000)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(

                  onChanged: (value) {
                    this.widget.fm.startTime = value;
                  },
                  onTap: () {
                    displayTimeDialog(0);
                  },
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
                        }
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    hintText: "${this.widget.fm.startTime}",
                    hintStyle: const TextStyle(color: Color(0xff000000)),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  onChanged: (value) {
                    this.widget.fm.endTime = value;
                        },
                  onTap: () {
                    displayTimeDialog(0);
                  },
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
                    hintText: "${this.widget.fm.endTime}",
                    hintStyle: const TextStyle(color: Color(0xff000000)),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _addressController,
                  onChanged: (value) {
                     this.widget.fm.address;
                  },
                  enableSuggestions: false,
                  autocorrect: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(

                      icon: SvgPicture.asset("assets/images/location.svg",height: 20,width: 20,),
                      onPressed: (){
                        var isAndroid;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlacePicker(
                              apiKey: Platform.isAndroid
                                  ? "AIzaSyCUCQDd8Qzc0IvD2Kki-O3eVGJpmkMvASs"
                                  : "YOUR IOS API KEY",
                              onPlacePicked: (result) {
                                print("picked format Address=${result.formattedAddress}");
                                print("picked Address lat-lon=${result.geometry?.location.lat}-${result.geometry?.location.lng}");
                                this.widget.fm.lat = (result.geometry?.location.lat) as double;
                                this.widget.fm.lng = (result.geometry?.location.lng) as double;
                               this.widget.fm.address = (result.formattedAddress) as String;
                                Navigator.of(context).pop();
                                setState(() {
                                  _addressController.text=result.formattedAddress.toString();
                                });
                              },
                              initialPosition: LatLng(29.907091,77.9986938),
                              useCurrentLocation: true,
                              resizeToAvoidBottomInset: false,
                            ),
                          ),
                        );
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    hintText:"${this.widget.fm.address}",
                    hintStyle: const TextStyle(color: Color(0xff000000)),
                  ),
                  ),
                const SizedBox(height: 15),
                TextFormField(
                  onChanged: (value) {
                    this.widget.fm.description;
                  },
                  controller: descriptionController,
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
                    hintText: "${this.widget.fm.description}",
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
                              "Update Class",
                              style: GoogleFonts.montserrat(color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
                             setState(() async {

                           ApiResponse res = await updateClass(this.widget.fm);
                            if(res.isSuccess){
                         showToast("Class updated successfully!");
                         Get.back();
                            }else {
                          showToast(res.message);
                              }
                             });
                            }

                        ),
              ))
    ]
             )
           )
        )
      )
    );
  }

}

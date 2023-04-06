import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/auth/AddressModel.dart';

import '../util/widgetUtil.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {


  String stateValue = "";
  AddressModel am = new AddressModel();

  final List<String> _stateList =
    [ " Pradesh", "Arunachal Pradesh", "Gujarat", "Haryana", "Himachal Pradesh",
      "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra",
       "Telangana", "Tripura", "Uttarakhand", "Uttar Pradesh",
       "Delhi"];

  String cityValue = "";

  final List<String> _cityList = ["Select City",
    "Agra","Meerut","Ghaziabad","Aligarh","Kanpur","Lucknow","Dehradun","Haridwar","Rishikesh","Jabalpur","Indore","Sagar"

  ];

  String districtValue = "";
  final List<String> _districtList = [ "Select District",
    "Chamoli","Uttarkashi","pauri Garhwal","Mathura", "Fatehpur","Mainpuri"
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top:10),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/footer_img.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0,right: 40,left: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Address',
                style: GoogleFonts.montserrat(
                  //  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 35,
                  fontWeight: FontWeight.w600,color: const Color(0xff000000)),),
              const SizedBox(height: 80,),


              DropdownButtonFormField(
                isExpanded: true,
                itemHeight: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  hintText: 'Select State',
                  prefixIcon:IconButton(

                      icon: SvgPicture.asset("assets/images/state.svg",height: 20,width: 20,),
                      onPressed:() {}
                  ),
                ),
                dropdownColor: Colors.white,
                value: stateValue.isEmpty ? _stateList[0] : stateValue,
                onChanged: (newValue) {

                  setState(() {
                   stateValue = newValue.toString();
                   am.state = stateValue;

                  });
                },
                items: _stateList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(fontSize: 14, ),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 12,),
              DropdownButtonFormField(
                isExpanded: true,
                itemHeight: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  hintText: 'Select City',
                  prefixIcon: IconButton(

                      icon: SvgPicture.asset("assets/images/city.svg",height: 20,width: 20,),
                      onPressed:() {}
                  ),
                ),
                dropdownColor: Colors.white,
                value: cityValue.isEmpty ? _cityList[0] : cityValue,
                onChanged: (newValue) {

                  am.city = newValue.toString();

                  setState(() {
                    cityValue = newValue.toString();

                  });
                },
                items: _cityList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(fontSize: 14, ),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 12,),
              DropdownButtonFormField(
                isExpanded: true,
                itemHeight: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  hintText: 'Select District',
                  prefixIcon:IconButton(

                      icon: SvgPicture.asset("assets/images/distric.svg",height: 20,width: 20,),
                      onPressed:() {}
                  ),
                ),
                dropdownColor: Colors.white,
                value: districtValue.isEmpty ? _districtList[0] : districtValue,
                onChanged: (newValue) {
                 am.district= newValue.toString();

                  setState(() {
                    districtValue = newValue.toString();

                  });
                },
                items: _districtList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(fontSize: 14, ),
                    ),
                  );
                }).toList(),
              ),



           SizedBox(height: 12,),
              TextField(
                onChanged: (value){
                  am.address = value;
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Address',
                  prefixIcon: IconButton(

                    icon: SvgPicture.asset("assets/images/addressp.svg",height: 20,width: 20,),
                    onPressed:() {}
                  ),
                ),
              ),
              SizedBox(height: 12,),

              TextField(
                onChanged: (value){
                  am.pinCode = value;
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: 'pincode',
                    prefixIcon: IconButton(

                        icon: SvgPicture.asset("assets/images/pincode.svg",height: 20,width: 20,),
                        onPressed:() {}
                ),
              ),
              ),
              SizedBox(height: 60,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 160.0, vertical: 20.0),
                    primary: const Color(0XFF0E132F),
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    "ADD",
                    style: GoogleFonts.montserrat(color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    print(am.toString());
                    Get.back(result: am);
                  }

                      ),
            ],
          ),
        ),
      )





    );

    }
}


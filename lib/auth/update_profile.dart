import 'dart:collection';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pyp_nepal/network/Api_client.dart';
import 'package:pyp_nepal/network/Api_response.dart';
import 'package:pyp_nepal/network/model/login_model.dart';
import 'package:pyp_nepal/util/uiUtil.dart';
import '../network/model/samitiTypeModel.dart';
import '../network/model/update_profile_model.dart';
import '../util/app_preference.dart';
import '../util/widgetUtil.dart';
import 'AddressModel.dart';
import 'address.dart';

  class Profile extends StatefulWidget {
 const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  User? _user;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final fatherNameController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final _dateController = TextEditingController();

  String _gender = "";
  String _maritalStatus = "";

  Color _maleBtnColor = Colors.orange;
  Color _femaleBtnColor = Colors.transparent;

  Color _marriedBtnColor = Colors.transparent;
  Color _unmarriedBtnColor = Colors.orange;

  String dropDownValue = "";


  List<SamtitTypeModel> samiti = [];
  SamtitTypeModel? samitiModel = null;

  _getAssociationTypes() async {
    ApiResponse response  = await samitiType();
    if(response.isSuccess){
      setState(() {
        samiti = response.result;
        samitiModel = samiti.firstWhereOrNull((element) => element.code == _user?.organization);
      });
    } else{
      showToast(response.message);
    }
  }


  Map<String, dynamic> _reqBody = HashMap();
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
      _user?.dateOfBirth = formattedDate;
      });
    }
  }

  Future<void> _cropImage() async {
    if (_imageFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _imageFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 60,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'PYP Crop Profile Pic',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'PYP Crop Profile Pic',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _pickedFilePath = croppedFile.path;
        });
      }
    }
  }

  PickedFile? _imageFile;
  String _pickedFilePath = "";
  final ImagePicker picker = ImagePicker();

  Future takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile!;
      _pickedFilePath = pickedFile.path;
      _cropImage();
    });
  }
  Widget getProfilePicView() {
    if (_imageFile == null) {
      return CircleAvatar(
        radius: 60,
        backgroundImage: AssetImage("assets/images/proPic.png"),
      );
    } else {
      return CircleAvatar(
          radius: 60, backgroundImage: FileImage(File(_imageFile!.path)));
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user = getProfile();
    _initForm();
    _getAssociationTypes();
  }

  _initForm(){
    final _user = this._user;
    if(_user != null){
      _gender = _user.gender;
      nameController.text = _user.name;
      fatherNameController.text = _user.fatherOrHusbandName;
      mobileController.text = _user.mobileNumber;
      emailController.text = _user.email;
      _dateController.text = _user.dateOfBirth;
      addressController.text = _user.address;
      _maritalStatus = _user.maritalStatus;
      _updateMaritalStatusBg();
      _updateGenderButtonsBg();
      setState(() {

      });
    }
  }

  _updateGenderButtonsBg(){
    if (_gender == "Male") {
      _maleBtnColor = Colors.orange;
      _femaleBtnColor = Colors.transparent;
    } else {
      _maleBtnColor = Colors.transparent;
      _femaleBtnColor = Colors.orange;
    }
  }

  _updateMaritalStatusBg(){
    if (_maritalStatus == "Single") {
      _marriedBtnColor = Colors.transparent;
      _unmarriedBtnColor = Colors.orange;
    } else {
      _marriedBtnColor = Colors.orange;
      _unmarriedBtnColor = Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/footer_img.png'),
                    fit: BoxFit.cover)),
          ),
        ),
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.only(top: 0, right: 40, left: 40),
          child: Form(
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
              child: Stack(children: <Widget>[
                ClipOval(child: getProfilePictureView(_user == null ? "" : _user!.image)),
                Positioned(
                    bottom: 0,
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Text("Choose Profile Picture",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 16,
                                          )),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            TextButton.icon(
                                              icon: const Icon(
                                                Icons.camera,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {
                                                takePhoto(ImageSource.camera);
                                              },
                                              label: Text("Camera",
                                                  style:
                                                  GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            TextButton.icon(
                                              icon: const Icon(
                                                Icons.image,
                                                color: Colors.black,
                                              ),
                                              onPressed: () {
                                                takePhoto(
                                                    ImageSource.gallery);
                                              },
                                              label: Text("Gallery",
                                                  style:
                                                  GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            TextButton.icon(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(
                                                Icons.cancel,
                                                color: Colors.black,
                                              ),
                                              label: Text("Cancel",
                                                  style:
                                                  GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  )),
                                            ),
                                          ]),
                                    ],
                                  ));
                            });
                      },
                      child: const Image(
                        image: AssetImage("assets/images/edit_userPic.png"),
                        height: 30,
                        width: 30,
                      ),
                    ))
              ]),
        ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    _user?.name = value;
                  },
                  controller: nameController,
                  decoration: textFieldDecoration("name", Icons.person),
                  style: GoogleFonts.montserrat(),
                  ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    _user?.fatherOrHusbandName = value;
                  },
                  autofocus: false,
                  controller: fatherNameController,
                  decoration: textFieldDecoration("father or Husband name", Icons.person),
                  style: GoogleFonts.montserrat(),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: mobileController,
                  onChanged: (value) {
                    _user?.mobileNumber = value;
                  },
                  autofocus: true,
                  decoration: textFieldDecoration("Mobile number", Icons.phone_android),
                  style: GoogleFonts.montserrat(),
                ),
                const SizedBox(height: 20),

                InkWell(
                  child: TextFormField(
                    controller: _dateController,
                    onChanged: (value) {
                      _user?.dateOfBirth = value;
                    },
                    onTap: (){
                     _selectDate(context);
                    },
                    autofocus: false,
                    decoration: textFieldDecoration("Date of Birth", Icons.calendar_month),
                    style: GoogleFonts.montserrat(),
                  ),
                ),
                const SizedBox(height: 20),

                TextFormField(
                    controller: emailController,
                  onChanged: (value) {
                    _user?.email = value;
                  },
                  autofocus: false,
                  decoration: textFieldDecoration("Email", Icons.email),
                  style: GoogleFonts.montserrat(),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: MultiValidator([
                    RequiredValidator(errorText: "Required\*"),
                    EmailValidator(errorText: "Please enter valid email")]
                )),
                const SizedBox(height: 14),



                /// GENDER BUTTON
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(

                      color: const Color(0xFFF6F2F2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                  child: Row(
                    children: [
                      const SizedBox(width: 7),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("male");
                            _gender = "Male";
                            _user?.gender = _gender;
                            setState(() {
                              _updateGenderButtonsBg();
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _maleBtnColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.male),
                                const SizedBox(width: 6),
                                Text("Male")
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _gender = "Female";
                            _user?.gender = _gender;
                            setState(() {
                              _updateGenderButtonsBg();
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _femaleBtnColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.female),
                                const SizedBox(width: 6),
                                Text("Female")
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                    ],
                  ),
                ),


                const SizedBox(height: 14),
                /// MARITAL STATUS BUTTON
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF6F2F2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                  child: Row(
                    children: [
                      const SizedBox(width: 7),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("married");
                            _maritalStatus = "Married";
                            _user?.maritalStatus = _maritalStatus;
                            setState(() {
                              _updateMaritalStatusBg();
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _marriedBtnColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.group),
                                const SizedBox(width: 10),
                                Text("Married")
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("unmarried");
                            _maritalStatus = "Single";
                            _user?.maritalStatus = _maritalStatus;
                            setState(() {
                              _updateMaritalStatusBg();
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _unmarriedBtnColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.person),
                                const SizedBox(width: 6),
                                Text("Single")
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 7),
                    ],
                  ),
                ),
                SizedBox(height: 14,),
                samitiModel == null ? SizedBox() :  DropdownButtonFormField(

                  isExpanded: true,
                  itemHeight: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    hintText: 'Organisation associated with',
                    prefixIcon: const Icon(Icons.group),
                  ),
                  dropdownColor: Colors.white,
                  value: samitiModel == null ? samiti[0] : samitiModel,
                  onChanged: (newValue) {
                    setState(() {
                      samitiModel = (newValue as SamtitTypeModel);
                      _user!.organization = samitiModel!.code;
                    });
                  },
                  items: samiti.map<DropdownMenuItem<SamtitTypeModel>>((SamtitTypeModel value) {
                    return DropdownMenuItem<SamtitTypeModel>(
                      value: value,
                      child: Text(
                        value.name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 14),

                TextFormField(
                  onTap: () async {
                    AddressModel am = await Get.to(const Address());
                    _reqBody["address"] = am.address;
                    _reqBody["city"] = am.city;
                    _reqBody["state"] = am.state;
                    _reqBody["district"] = am.district;
                    _reqBody["pincode"] = am.pinCode;
                    setState(() {
                      addressController.text = am.toString();
                    });
                  },
                  controller: addressController,
                  onChanged: (value) {
                    _user?.address= value;
                  },
                  style: GoogleFonts.montserrat(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: 'Edit Address',
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/addIcon.svg",
                        color: Colors.black45,
                        height: 22,
                        width: 22,
                      ),
                      onPressed: () {
                        Get.to(Address());
                      },
                    ),
                    prefixIcon: IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/address_home.svg",
                        height: 22,
                        width: 22,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(height: 60),

                Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 20.0),
                            backgroundColor: const Color(0XFF0E132F),
                            shape: const StadiumBorder(),
                          ),
                          child: Text(
                          "Update Profile",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          onPressed: () async {
                            _user?.organization = _user?.organization?? "1";
                            if(_user != null){
                              ApiResponse res = await updateProfile(_user!);
                              if(res.isSuccess){
                                updateUser(res.result);
                                showToast("Profile updated successfully!");
                                Get.back();
                              }else{
                                showToast(res.message);
                              }
                            }
                            setState(() {
                            });
                          }
                        ))),

      ])
     )
                ),
    ),
    );

  }
}

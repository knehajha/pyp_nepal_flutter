import 'dart:collection';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart'; //same yhi tha morning me b
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pyp_nepal/auth/signIn.dart';
import 'package:pyp_nepal/network/Api_client.dart';
import 'package:pyp_nepal/network/Api_response.dart';
import 'package:pyp_nepal/network/model/registration_model.dart';
import 'package:pyp_nepal/network/model/uploadImageModel.dart';
import 'package:pyp_nepal/util/progress_dialog.dart';
import 'package:pyp_nepal/util/uiUtil.dart';
import '../network/model/samitiTypeModel.dart';
import '../network/model/samitiTypeModel.dart';
import '../network/model/samitiTypeModel.dart';
import '../util/widgetUtil.dart';
import 'AddressModel.dart';
import 'address.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);




  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final mobController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final maritalStatusController = TextEditingController();
  final createPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  final orgDropDownController = TextEditingController();
  final addressController = TextEditingController();

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
        dobController.text = formattedDate;
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

  bool maleBtnClick = true;
  bool femaleBtnClick = true;

  Color _maleBtnColor = Colors.orange;
  Color _femaleBtnColor = Colors.transparent;

  bool marriedBtnClick = true;
  bool unmarriedBtnClick = true;

  Color _marriedBtnColor = Colors.transparent;
  Color _unmarriedBtnColor = Colors.orange;

  String dropDownValue = "";
  Map<String, dynamic> _reqBody = HashMap();


  String? gender;

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

  _submitForm() async {
    _reqBody["userType"] = "1";
    var response = await signup(_reqBody);
    //loader finish
    Navigator.of(context).pop();
    if (response.isSuccess) {
      String message = (response.result as RegisterModel).message ??
          "Registration Successful!";
      showToast(message);
      Get.to(const SignIn());
    } else {
      Get.snackbar("Error", response.message,
          colorText: Colors.white,
          backgroundColor: Colors.black,
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
          ));
    }
  }

  List<SamtitTypeModel> samiti = [];
  SamtitTypeModel? samitiModel = null;

  _getAssociationTypes() async {
    ApiResponse response  = await samitiType();
    if(response.isSuccess){
      setState(() {
        samiti = response.result;
        samitiModel = samiti.first;
      });
    } else{
      showToast(response.message);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAssociationTypes();
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
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Stack(children: <Widget>[
                  getProfilePicView(),
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
                          image: AssetImage("assets/images/photo_camera.png"),
                          height: 30,
                          width: 30,
                        ),
                      ))
                ]),
              ),

              const SizedBox(height: 20),

              Text(
                'Sign Up',
                style: GoogleFonts.montserrat(
                  //  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Create account to continue!',
                style: GoogleFonts.montserrat(
                  //  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 14),

              TextFormField(
                onChanged: (value) {
                  _reqBody["name"] = value;
                },
                decoration: textFieldDecoration("Name", Icons.person),
                style: GoogleFonts.montserrat(),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Required\*"),
                ]),
              ),
              const SizedBox(height: 14),

              TextFormField(
                onChanged: (value) {
                  _reqBody["fatherOrHusbandName"] = value;
                },
                style: GoogleFonts.montserrat(),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Required\*"),
                ]),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Father/Husband name',
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 14),

              TextFormField(
                onChanged: (value) {
                  _reqBody["mobileNumber"] = value;
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Mobile No.',
                  prefixIcon: const Icon(Icons.phone_android),
                ),
                keyboardType: TextInputType.number,
                maxLength: 10,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.length < 10) {
                    return "Please enter valid mobile number\*";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 14),

              TextFormField(
                onTap: () {
                  print("dob clicked");
                  _selectDate(context);
                },
                readOnly: true,
                controller: dobController,
                onChanged: (value) {
                  _reqBody["dateOfBirth"] = value;
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Date of birth',
                  prefixIcon: IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/calendar-4.svg",
                      height: 19,
                      width: 19,
                    ),
                    onPressed: () {},
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Please Enter valid DOB\*"),
                ]),
              ),
              const SizedBox(height: 14),

              TextFormField(
                onChanged: (value) {
                  _reqBody["email"] = value;
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Email Id',
                  prefixIcon: const Icon(Icons.mail),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Required\*"),
                  EmailValidator(errorText: "Please enter valid email")
                ]),
              ),
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

                          setState(() {
                            if (maleBtnClick = !maleBtnClick) {
                              _maleBtnColor = Colors.orange;
                              _femaleBtnColor = Colors.transparent;
                            } else {
                              _maleBtnColor = Colors.transparent;
                              _femaleBtnColor = Colors.orange;
                            }
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
                    const SizedBox(width: 20),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print("female");

                          setState(() {
                            if (maleBtnClick = !maleBtnClick) {
                              _maleBtnColor = Colors.orange;
                              _femaleBtnColor = Colors.transparent;
                            } else {
                              _maleBtnColor = Colors.transparent;
                              _femaleBtnColor = Colors.orange;
                            }
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

                          setState(() {
                            if (marriedBtnClick = !marriedBtnClick) {
                              _marriedBtnColor = Colors.transparent;
                              _unmarriedBtnColor = Colors.orange;
                            } else {
                              _marriedBtnColor = Colors.orange;
                              _unmarriedBtnColor = Colors.transparent;
                            }
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

                          setState(() {
                            if (marriedBtnClick = !marriedBtnClick) {
                              _marriedBtnColor = Colors.transparent;
                              _unmarriedBtnColor = Colors.orange;
                            } else {
                              _marriedBtnColor = Colors.orange;
                              _unmarriedBtnColor = Colors.transparent;
                            }
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

              const SizedBox(height: 14),


              TextFormField(
                  onChanged: (value) {
                    _reqBody["password"] = value;
                  },
                  style: GoogleFonts.montserrat(),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    hintText: 'Create Password',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Required\*";
                    } else {
                      return null;
                    }
                  }),
              const SizedBox(height: 14),

              TextFormField(
                  style: GoogleFonts.montserrat(),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    hintText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Required\*";
                    } else {
                      return null;
                    }
                  }),
              const SizedBox(height: 14),
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
                    _reqBody["organization"] = samitiModel!.code;
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
                readOnly: true,
                controller: addressController,
                onChanged: (value) {
                  _reqBody["address"] = value;
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Add Address',
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/addIcon.svg",
                      color: Colors.black45,
                      height: 22,
                      width: 22,
                    ),
                    onPressed: () {},
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
              const SizedBox(
                height: 40,
              ),
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
                          "Submit",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            showProgressDialog(context);

                            if (_pickedFilePath.isNotEmpty) {
                              ApiResponse res =
                                  await uploadImage(_pickedFilePath);
                              if (res.isSuccess) {
                                _reqBody["image"] =
                                    (res.result as UploadImageModel).name;
                              }
                            }

                            _submitForm();
                          }
                        },
                      ))),
            ]),
          ),
        ),
      ),
    );
  }
}

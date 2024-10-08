import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pyp_nepal/Yoga%20Trainer/trainerHome.dart';
import 'package:pyp_nepal/auth/forgotpass.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';
import 'package:pyp_nepal/network/Api_client.dart';
import 'package:pyp_nepal/network/model/login_model.dart';
import 'package:pyp_nepal/util/app_preference.dart';
import 'package:pyp_nepal/util/uiUtil.dart';
import '../util/progress_dialog.dart';
import '../util/widgetUtil.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool status = false;
  bool isChecked = false;
  bool passwordVisible = false;
  String userName = "";
  String password = "";
  String? fcmToken = "";
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  StreamSubscription? subscription  ;
  var isDeviceConnected = false;
  bool isAlertSet = false;



  showInDialogBox() {
    showCupertinoDialog<String>(context: context,
        builder: (BuildContext context) =>
            CupertinoAlertDialog(
              title: Text("No connection", style: GoogleFonts.montserrat(
                fontSize: 16, fontWeight: FontWeight.w500,)),
              content: Text("Please check your internet connectivity",
                style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w300,
                ),),
              actions: <Widget>[
                TextButton(onPressed: () async {
                  Navigator.pop(context, "Cancel");
                  setState(() => isAlertSet = false);
                  isDeviceConnected =
                  await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    showInDialogBox();
                    setState(() {
                      isAlertSet = true;
                    });
                  }
                },
                    child: Text("OK", style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w500,),))
              ],
            ));
  }

  getInConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result)
      async{
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if(!isDeviceConnected && isAlertSet == false) {
          showInDialogBox();
          setState(() => isAlertSet = true);
        }else(showProgressDialog(context));
      },

      );

  @override
  void dispose(){
    subscription!.cancel();
    super.dispose();
  }



  @override
  void initState() {
    super.initState();
    _getFcmToken();
    String? u = getUserName();
    if(u != null && u.isNotEmpty){
      userNameController.text = u;
      passwordController.text = getPassword()??"";
      isChecked = true;
      setState(() {
      });
    }
  }



  _getFcmToken() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      fcmToken = token;
    }).onError((err) {
      print(err.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgContainer(),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding : const EdgeInsets.all(30),
                  child: Center(
                    child: appLogo(),
                  ),
                ),
                Text(
                  "Sign In",
                  style: GoogleFonts.montserrat(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 3,),
                Text(
                  "Create account to continue!",
                  style: GoogleFonts.montserrat(),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: userNameController,
                  onChanged: (value) {
                    userName = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email/Phone number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: 'Email/Phone number',
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: passwordController,
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: !passwordVisible,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),

                    ),
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      onTap: () {
                        Get.to(const ForgotPass());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, right: 10),
                        child: Text(
                          "Forgot password?",
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff3B0000)),
                        ),
                      )),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (isOn) {
                          setState(() {
                            isChecked = isOn!;
                          });
                        }),
                    Text(
                      'Remind me next time',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 59,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      primary: Colors.black,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      "SIGN IN",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () async {
                      print("FCM_TOKEN>>${fcmToken}");
                      if (userName.isEmpty) {
                        showToast("Please enter user name");
                      } else if (password.isEmpty) {
                        showToast("Please enter password");
                      } else {
                       getInConnectivity();
                        var response =
                            await login(userName, password, fcmToken);
                        Navigator.of(context).pop();

                        if (response.isSuccess) {

                          if(isChecked){
                            storeCredentials(userName, password);
                          }

                          saveUser(response.result);
                          LoginModel m = response.result as LoginModel;

                          switch (m.user.userType) {
                            case "1":
                              Get.offAll(const Dashboard());

                              break;
                            case "2":
                              Get.offAll(const TrainerHome());
                              break;
                            default:
                              showToast("Invalid user");
                              break;
                          }
                        } else {
                          showToast(response.message);
                        }
                      }
                    },
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

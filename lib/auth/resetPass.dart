import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/auth/signIn.dart';
import 'package:pyp_nepal/network/api_methods.dart';

import '../util/widgetUtil.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool status = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgContainer(),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Reset Password",
                    style: GoogleFonts.montserrat(
                        fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: oldPassController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Old Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      hintText: 'Old Password',
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Please enter valid password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: newPassController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value!.length < 6) {
                        return "Please enter valid password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: confirmPassController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      hintText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (confirmPassController.text != newPassController.text) {
                        return "Please enter valid password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 59,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        backgroundColor: Colors.black,
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        "Reset".toUpperCase(),
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ApiMethods.resetPasswordAPI(
                              context,
                              confirmPassController.text,
                              newPassController.text,
                              oldPassController.text);
                        }
                      },
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

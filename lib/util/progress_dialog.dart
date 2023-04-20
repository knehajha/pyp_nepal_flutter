
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../auth/login.dart';
import 'app_preference.dart';

void showProgressDialog(BuildContext context, [bool mounted = true]) async {
  // show the loading dialog
  showDialog(
    // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          // The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // The loading indicator
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                // Some text
                Text('Loading...')
              ],
            ),
          ),
        );
      });
}

logoutAlert(BuildContext context){
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed:  () { Get.back();},
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed:  () {
        logout();
        Get.offAll(Login());
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      title: Text("Logout?"),
      content: Text("Do you want to exit this application?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
}
deleteAlert(BuildContext context){
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () { Get.back();},
  );
  Widget continueButton = TextButton(
    child: Text("Delete"),
    onPressed:  () {
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(

    title: Text("You are about to delete a class"),
    content: Text("This will delete all the information related to the class, Are You sure ? "),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

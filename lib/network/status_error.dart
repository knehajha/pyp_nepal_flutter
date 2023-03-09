import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShowError {
  /// 1.
  tokenExpired(
      BuildContext context, String title, String message, String buttonLabel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type dialoge
        return CupertinoAlertDialog(
          title:
              Padding(padding: const EdgeInsets.all(4.0), child: Text(title)),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text(buttonLabel),
              onPressed: () {
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const LoginScreen(),
                //     ),
                //     (route) => false);
              },
            )
          ],
        );
      },
    );
  }
}

/// 2.
void showDialogSingleButton(
    BuildContext context, String title, String? message, String buttonLabel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      //return object of type dialoge
      return CupertinoAlertDialog(
        title: Padding(
            padding: const EdgeInsets.all(0.0),
            child: SizedBox(
              height: 20,
              child: ElevatedButton(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  //setState(() => isVisible = !isVisible);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  shadowColor: Colors.white,
                  elevation: 0.0,
                  // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            )),
        content: ElevatedButton(
          child: Text(
            message ?? "",
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            //setState(() => isVisible = !isVisible);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            shadowColor: Colors.white,
            elevation: 0.0,

            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: const TextStyle(
              fontSize: 14,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        actions: <Widget>[
          // Container(
          //   height: 30,
          //   child: InkWell(
          //     onTap: () {
          //        Navigator.of(context).pop();
          //     },
          //     child: Text(
          //       buttonLabel,
          //     ),
          //   ),
          // )
          ElevatedButton(
            child: Text(
              buttonLabel,
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              shadowColor: Colors.white,
              elevation: 0.0,

              // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: const TextStyle(
                fontSize: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ],
      );
    },
  );
}

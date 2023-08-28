import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commonWidgets/animations/animation.dart';

class DialogsBuilder {
  static showErrorSnackBar(BuildContext context, String message,
      {void Function()? onDismissed,
      Function? afterDismissed,
      bool? barrierDismissible}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext cxt) {
        return SafeArea(
          child: Stack(children: [
            TopSnackBar(
              onDismissed: onDismissed ?? () {},
              showOutAnimationDuration: const Duration(seconds: 3),
              hideOutAnimationDuration: const Duration(milliseconds: 550),
              displayDuration: const Duration(seconds: 1),
              additionalTopPadding: 16.0,
              onTap: () {},
              leftPadding: 16,
              rightPadding: 16,
              child: Align(
                alignment: Alignment.topCenter,
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.red,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Icon(Icons.close),
                        ),
                        // SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: Text(message),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  static showWarningSnackBar(BuildContext context, String message) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext cxt) {
        return SafeArea(
          child: Stack(children: [
            TopSnackBar(
              onDismissed: () {
                // Navigator.pop(context);
              },
              showOutAnimationDuration: const Duration(seconds: 3),
              hideOutAnimationDuration: const Duration(milliseconds: 550),
              displayDuration: const Duration(seconds: 1),
              additionalTopPadding: 16.0,
              onTap: () {},
              leftPadding: 16,
              rightPadding: 16,
              child: Align(
                alignment: Alignment.topCenter,
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Icon(Icons.warning),
                        ),
                        // SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: Text(message),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  static showSuccessSnackBar(BuildContext context, String message,
      {void Function()? onDismissed,
      Function? afterDismissed,
      bool? barrierDismissible}) {
    if (!showDialogValue) {
      showDialogValue = true;
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.transparent,
          snackPosition: SnackPosition.TOP,
          animationDuration: const Duration(milliseconds: 100),
          messageText: Align(
            alignment: Alignment.topCenter,
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.yellow.withOpacity(0.8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.check_circle),
                    ),
                    // SizedBox(width: 10),
                    Expanded(
                      flex: 5,
                      child: Text(message),
                    ),
                  ],
                ),
              ),
            ),
          ),
          duration: const Duration(minutes: 99999),
          onTap: (value) {
            Get.closeCurrentSnackbar();
            showDialogValue = false;
          },
        ),
      );
      // Get.dialog(
      //   barrierColor: Colors.transparent,
      //   SafeArea(
      //     child: Stack(
      //       children: [
      //         TopSnackBar(
      //           onDismissed: onDismissed ?? () {},
      //           showOutAnimationDuration: const Duration(seconds: 2),
      //           hideOutAnimationDuration: const Duration(milliseconds: 550),
      //           displayDuration: const Duration(seconds: 1),
      //           additionalTopPadding: 16.0,
      //           onTap: () {},
      //           leftPadding: 16,
      //           rightPadding: 16,
      //           child: Align(
      //             alignment: Alignment.topCenter,
      //             child: Material(
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(20.0),
      //               ),
      //               color: Theme.of(context).primaryColor,
      //               child: Container(
      //                 padding: EdgeInsets.symmetric(
      //                   vertical: 25.getHeight(),
      //                   horizontal: 15.getWidth(),
      //                 ),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     Expanded(
      //                       flex: 1,
      //                       child: SvgPicture.asset(
      //                         AllIcons.successDialog,
      //                         color: ColorConstants.darkGray,
      //                       ),
      //                     ),
      //                     // SizedBox(width: 10),
      //                     Expanded(
      //                       flex: 5,
      //                       child: Text(
      //                         message,
      //                         style: const TextStyle(
      //                           color: ColorConstants.darkGray,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // );
    }
  }

  static bool showDialogValue = false;
  static apiErrorSnackBar(String message) {
    if (!showDialogValue) {
      showDialogValue = true;
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.transparent,
          snackPosition: SnackPosition.TOP,
          animationDuration: const Duration(milliseconds: 100),
          messageText: Align(
            alignment: Alignment.topCenter,
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.yellow.withOpacity(0.8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.close),
                    ),
                    // SizedBox(width: 10),
                    Expanded(
                      flex: 5,
                      child: Text(message),
                    ),
                  ],
                ),
              ),
            ),
          ),
          duration: const Duration(minutes: 99999),
          onTap: (value) {
            Get.closeCurrentSnackbar();
            showDialogValue = false;
          },
        ),
      );

      // Get.dialog(
      //   barrierColor: Colors.transparent,
      //   SafeArea(
      //     child: Stack(
      //       children: [
      //         TopSnackBar(
      //           onDismissed: () {},
      //           showOutAnimationDuration: const Duration(milliseconds: 3),
      //           hideOutAnimationDuration: const Duration(milliseconds: 0),
      //           displayDuration: const Duration(hours: 999),
      //           additionalTopPadding: 16.0.getHeight(),
      //           onTap: null,
      //           leftPadding: 16.getWidth(),
      //           rightPadding: 16.getWidth(),
      //           child: Align(
      //             alignment: Alignment.topCenter,
      //             child: Material(
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(20.0)),
      //               color: ColorConstants.yellow.withOpacity(0.8),
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(20.0),
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Colors.black.withOpacity(0.1),
      //                       spreadRadius: 2,
      //                       blurRadius: 3,
      //                       offset: const Offset(
      //                           0, 3), // changes position of shadow
      //                     ),
      //                   ],
      //                 ),
      //                 padding: EdgeInsets.symmetric(
      //                   vertical: 25.getHeight(),
      //                   horizontal: 15.getWidth(),
      //                 ),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     Expanded(
      //                         flex: 1,
      //                         child: SvgPicture.asset(AllIcons.closeDialog)),
      //                     // SizedBox(width: 10),
      //                     Expanded(
      //                       flex: 5,
      //                       child: Text(message),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ).then((v) => showDialogValue = false);
    } else {
      Get.closeCurrentSnackbar();
      showDialogValue = true;
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.transparent,
          snackPosition: SnackPosition.TOP,
          animationDuration: const Duration(milliseconds: 100),
          messageText: Align(
            alignment: Alignment.topCenter,
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.yellow.withOpacity(0.8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.close),
                    ),
                    // SizedBox(width: 10),
                    Expanded(
                      flex: 5,
                      child: Text(message),
                    ),
                  ],
                ),
              ),
            ),
          ),
          duration: const Duration(minutes: 99999),
          onTap: (value) {
            Get.closeCurrentSnackbar();
            showDialogValue = false;
          },
        ),
      );
    }
  }

  static apiSuccessSnackBar(String message) {
    Get.dialog(
      barrierColor: Colors.transparent,
      Stack(
        children: [
          TopSnackBar(
            onDismissed: () {},
            showOutAnimationDuration: const Duration(milliseconds: 550),
            hideOutAnimationDuration: const Duration(milliseconds: 550),
            displayDuration: const Duration(seconds: 1),
            additionalTopPadding: 16.0,
            onTap: () {},
            leftPadding: 16,
            rightPadding: 16,
            child: Align(
              alignment: Alignment.topCenter,
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.yellow.withOpacity(0.8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(message),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

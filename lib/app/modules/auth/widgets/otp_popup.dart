import 'package:bro_resturant_bar/app/modules/auth/widgets/reset_password_popup.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:bro_resturant_bar/widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).viewInsets.bottom),

      child: Container(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: 0.025.w(context),
          vertical: 0.020.h(context),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.030.toresponsive(context)),
            topRight: Radius.circular(0.030.toresponsive(context)),
          ),
        ),

        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.cancel, color: Colors.redAccent),
                  onPressed: () => Get.back(),
                ),
              ),
              Text(
                'Enter 4 Digits Code',
                style: TextStyle(
                  fontSize: 0.024.toresponsive(context),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 0.010.h(context)),
              Text(
                'Enter the 4 digits code that you received on email.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 0.014.h(context),
                  color: const Color.fromARGB(255, 96, 95, 95),
                ),
              ),

              SizedBox(height: 0.030.h(context)),

              // OTP Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _otpBox(context, first: true, last: false),
                  _otpBox(context, first: false, last: false),
                  _otpBox(context, first: false, last: false),
                  _otpBox(context, first: false, last: true),
                ],
              ),

              SizedBox(height: 0.030.h(context)),

              CustomButton(
                btnName: 'Continue',
                callback: () {
                  Get.back();

                  Get.bottomSheet(
                    ResetPasswordPopup(),
                    //isScrollControlled: true,
                    //backgroundColor: Colors.transparent,
                  );
                },
              ),
              SizedBox(height: 0.015.h(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpBox(
    BuildContext context, {
    required bool first,
    required bool last,
  }) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black12),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}

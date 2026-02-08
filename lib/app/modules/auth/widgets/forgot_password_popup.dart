import 'package:bro_resturant_bar/app/modules/auth/widgets/otp_popup.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:bro_resturant_bar/widgets/custom_textfield.dart';
import 'package:bro_resturant_bar/widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPopup extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
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
          //  borderRadius: BorderRadius.all(0.030.toresponsive(context)),
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
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.cancel, color: Colors.redAccent),
                ),
              ),

              Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 0.024.toresponsive(context),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 0.010.h(context)),

              Text(
                'Enter your email for your verifiacation process,\nwe will send 4 digits code to your email.,',
                style: TextStyle(
                  fontSize: 0.014.h(context),
                  color: const Color.fromARGB(255, 96, 95, 95),
                  //fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 0.030.h(context)),

              CustomTextfield(
                hintText: 'Email',
                isPassword: false,
                controller: emailController,
              ),

              SizedBox(height: 0.030.h(context)),

              CustomButton(
                btnName: 'Continue',
                callback: () {
                  if (emailController.text.isNotEmpty) {
                    //print('Sending OTP to ${emailController.text}');
                    //.toNamed(Routes.OTP);
                    Get.back();

                    Get.bottomSheet(
                      OtpPopup(),
                      // isScrollControlled: true,
                      //backgroundColor: Colors.transparent,
                    );
                  }
                },
              ),

              SizedBox(height: 0.015.h(context)),
            ],
          ),
        ),
      ),
    );
  }
}

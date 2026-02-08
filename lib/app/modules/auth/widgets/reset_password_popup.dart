import 'package:bro_resturant_bar/app/modules/auth/pages/login.dart';
import 'package:bro_resturant_bar/app/routes/app_routes.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:bro_resturant_bar/widgets/custom_textfield.dart';
import 'package:bro_resturant_bar/widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPopup extends StatelessWidget {
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.viewInsetsOf(context).bottom),
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
                'Reset Password',
                style: TextStyle(
                  fontSize: 0.024.toresponsive(context),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 0.010.h(context)),

              Text(
                'Set the new password for your account as you can \n login and access all the features.',
                style: TextStyle(
                  fontSize: 0.014.h(context),
                  color: const Color.fromARGB(255, 96, 95, 95),
                  //fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 0.030.h(context)),

              CustomTextfield(
                hintText: 'New Password',
                isPassword: false,
                controller: newpasswordController,
              ),

              SizedBox(height: 0.010.h(context)),

              CustomTextfield(
                hintText: 'Confirm Password',
                isPassword: false,
                controller: confirmpasswordController,
              ),

              SizedBox(height: 0.030.h(context)),

              CustomButton(
                btnName: 'Reset Password',
                callback: () {
                  if (newpasswordController.text ==
                      confirmpasswordController.text) {
                    Get.offAllNamed(Routes.LOGIN);
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

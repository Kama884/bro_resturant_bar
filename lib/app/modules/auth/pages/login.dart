import 'package:bro_resturant_bar/app/modules/auth/widgets/forgot_password_popup.dart';
import 'package:bro_resturant_bar/app/routes/app_routes.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';

import 'package:bro_resturant_bar/widgets/custom_textfield.dart';
import 'package:bro_resturant_bar/widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  TextEditingController get UserNameController => TextEditingController();
  TextEditingController get passwordController => TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(0.02.toresponsive(context)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SizedBox(height: 0.050.h(context)),
                SizedBox(
                  height: 0.200.h(context),
                  width: 0.400.w(context),
                  child: Image.asset(
                    'assets/images/login_page_image.png',
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 0.050.h(context)),

                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'Please log in to continue',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),

                SizedBox(height: 40),

                CustomTextfield(
                  hintText: 'User Name',
                  isPassword: false,
                  controller: UserNameController,
                ),

                SizedBox(height: 10),

                CustomTextfield(
                  hintText: 'Password',
                  isPassword: true,
                  suffixIcon: Icons.remove_red_eye,
                  controller: passwordController,
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled:
                              true, // Important for keyboard handling
                          backgroundColor: Colors
                              .transparent, // Allows custom rounded corners
                          builder: (context) => ForgotPasswordPopup(),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                CustomButton(
                  btnName: 'Login',

                  callback: () {
                    //print('Logged In');
                    // Get.offAllNamed(Routes.HOME_SCREEN);
                    Get.offAllNamed(Routes.MAIN_WRAPPER);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

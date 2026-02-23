import 'package:bro_resturant_bar/app/modules/profile/controller/profile_controller.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:bro_resturant_bar/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInformationPage extends StatelessWidget {
  PersonalInformationPage({super.key});

  //final RxString selectedGender = Male.obs;

  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final startdateController = TextEditingController();
  final positionController = TextEditingController();
  final addressController = TextEditingController();

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          'Personal Information',
          style: TextStyle(
            fontSize: 0.032.toresponsive(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 0.035.toresponsive(context)),
            child: Icon(
              Icons.notifications,
              size: 0.062.toresponsive(context),
              color: Colors.black,
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(0.016.toresponsive(context)),
          padding: EdgeInsets.all(0.020.toresponsive(context)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0.015.toresponsive(context)),
            border: Border.all(color: Colors.blueGrey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                return RadioGroup<String>(
                  groupValue: controller.selectedGender.value,
                  onChanged: (value) {
                    controller.selectedGender.value = value!;
                  },
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Radio<String>(value: "Male"),
                          Text("Male"),
                        ],
                      ),
                      SizedBox(width: 0.05.w(context)),
                      Row(
                        children: [
                          Radio<String>(value: "Female"),
                          Text("Female"),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 0.02.h(context)),
              //Full Name
              Text(
                'Full Name*',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 0.026.toresponsive(context),
                ),
              ),
              SizedBox(height: 0.01.h(context)),
              CustomTextfield(
                controller: nameController,
                hintText: 'Full Name',
              ),

              SizedBox(height: 0.02.h(context)),

              // PhoneNumber + DOB
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Phone Number
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number*',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 0.026.toresponsive(context),
                          ),
                        ),
                        SizedBox(height: 0.01.h(context)),
                        CustomTextfield(
                          controller: numberController,
                          hintText: 'Phone Number',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 0.03.w(context)),

                  ///DoB
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date of Birth',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 0.026.toresponsive(context),
                          ),
                        ),
                        SizedBox(height: 0.01.h(context)),
                        CustomTextfield(
                          controller: dobController,
                          hintText: 'Date of Birth',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.02.h(context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email*',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 0.026.toresponsive(context),
                    ),
                  ),
                  SizedBox(height: 0.01.h(context)),
                  CustomTextfield(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                ],
              ),

              SizedBox(height: 0.02.h(context)),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Start Date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Date*',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 0.026.toresponsive(context),
                          ),
                        ),
                        SizedBox(height: 0.01.h(context)),
                        CustomTextfield(
                          controller: startdateController,
                          hintText: 'Start Date',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 0.03.w(context)),

                  ///Position
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Position*',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 0.026.toresponsive(context),
                          ),
                        ),
                        SizedBox(height: 0.01.h(context)),
                        CustomTextfield(
                          controller: positionController,
                          hintText: 'Position',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.02.h(context)),

              ///Address
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 0.026.toresponsive(context),
                    ),
                  ),
                  SizedBox(height: 0.01.h(context)),
                  CustomTextfield(
                    controller: addressController,
                    hintText: 'Address',
                  ),

                  SizedBox(height: 0.03.h(context)),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      controller.sendPersonalInformation(
                        fullName: nameController.text,
                        phoneNumber: numberController.text,
                        dob: dobController.text,
                        email: emailController.text,
                        startDate: startdateController.text,
                        position: positionController.text,
                        address: addressController.text,
                      );
                    },
                    child: Text("Save"),
                  ),
                ],
              ),
              SizedBox(height: 0.02.h(context)),
            ],
          ),
        ),
      ),
    );
  }
}

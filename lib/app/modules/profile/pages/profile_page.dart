import 'dart:developer';

import 'package:bro_resturant_bar/app/modules/profile/pages/personal_information_page.dart';
import 'package:bro_resturant_bar/app/modules/profile/widgets/custom_profile_page_tile.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 0.036.toresponsive(context),
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

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.060.w(context),
          vertical: 0.010.h(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: 0.015.h(context)),
            Center(
              child: Column(
                children: [
                  CircleAvatar(radius: 0.13.toresponsive(context)),
                  SizedBox(height: 0.015.h(context)),
                  Text(
                    "Full Name of User",
                    style: TextStyle(
                      fontSize: 0.038.toresponsive(context),
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 0.005.h(context)),
                  Text(
                    "Position",
                    style: TextStyle(
                      fontSize: 0.030.toresponsive(context),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.005.h(context)),
            Divider(thickness: 1),
            SizedBox(height: 0.005.h(context)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Rs 15478",
                      style: TextStyle(
                        fontSize: 0.026.toresponsive(context),
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    Text(
                      "Sell",
                      style: TextStyle(
                        fontSize: 0.022.toresponsive(context),
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                // VerticalDivider(
                //   thickness: 1,
                //   indent: 0.010.toresponsive(context),
                //   endIndent: 0.010.toresponsive(context),
                // ),

                //SizedBox(width: 0.10.w(context)),
                Column(
                  children: [
                    Text(
                      "36",
                      style: TextStyle(
                        fontSize: 0.026.toresponsive(context),
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    Text(
                      "Orders",
                      style: TextStyle(
                        fontSize: 0.022.toresponsive(context),
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                //SizedBox(width: 0.10.w(context)),
                Column(
                  children: [
                    Text(
                      "15p",
                      style: TextStyle(
                        fontSize: 0.026.toresponsive(context),
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                    Text(
                      "Reward",
                      style: TextStyle(
                        fontSize: 0.022.toresponsive(context),
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 0.005.h(context)),
            Divider(thickness: 1),
            SizedBox(height: 0.005.h(context)),

            CustomProfilePageTile(
              icon: Icons.person_2,
              title: "Personal Information",
              onTap: () {
                Get.to(PersonalInformationPage());
              },
              isLogout: false,
            ),
            CustomProfilePageTile(
              icon: Icons.history_sharp,
              title: "History",
              onTap: () {
                log("History Clicked");
              },
              isLogout: false,
            ),
            CustomProfilePageTile(
              icon: Icons.notifications,
              title: "Notification",
              onTap: () {
                log("Notification Clicked");
              },
              isLogout: false,
            ),
            CustomProfilePageTile(
              icon: Icons.security,
              title: "Security",
              onTap: () {
                log("Secutity Clicked");
              },
              isLogout: false,
            ),
            CustomProfilePageTile(
              icon: Icons.logout,
              title: "LogOut",
              onTap: () {
                log("Logout Clicked");
              },
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }
}

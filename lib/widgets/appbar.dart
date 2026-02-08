import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.white,
      // elevation: 0,
      // automaticallyImplyLeading: false,
      toolbarHeight: 0.70.h(context),
      title: Row(
        children: [
          CircleAvatar(
            radius: 0.058.toresponsive(context),
            backgroundImage: AssetImage('assets/images/logo.jpg'),
          ),
          SizedBox(width: 0.020.w(context)),

          Expanded(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              //mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Bro Restuarnt & Bar',
                  style: TextStyle(
                    fontSize: 0.028.toresponsive(context),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                Text(
                  'Bharatpur-4, Lankhu Chitwan',
                  style: TextStyle(
                    fontSize: 0.020.toresponsive(context),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 5, right: 8),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 32,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(width: 0.015.w(context)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

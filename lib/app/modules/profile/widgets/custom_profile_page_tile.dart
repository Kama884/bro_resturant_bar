import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomProfilePageTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const CustomProfilePageTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.010.h(context)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade600),
        ),
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: isLogout ? Colors.red : Colors.black,
            size: 0.055.toresponsive(context),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: isLogout ? Colors.red : Colors.black,
              fontSize: 0.028.toresponsive(context),
            ),
          ),
          // trailing: Icon(
          //   Icons.arrow_forward_ios,
          //   color: Colors.grey.shade600,
          //   size: 0.035.toresponsive(context),
          // ),
        ),
      ),
    );
  }
}

import 'package:bro_resturant_bar/app/modules/dashboard/controller/navigation_controller.dart';
import 'package:bro_resturant_bar/app/modules/dashboard/pages/home_screen.dart';
import 'package:bro_resturant_bar/app/modules/ordering/pages/order_page.dart';
import 'package:bro_resturant_bar/app/modules/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(
      NavigationController(),
    );

    final List<Widget> screens = [
      const HomeScreen(),
      OrderPage(),

      const Center(child: Text("Message Page")),
      ProfilePage(),
    ];

    return Scaffold(
      body: Obx(() => screens[navigationController.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navigationController.currentIndex.value,
          onTap: (index) => navigationController.changeIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue[900],
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.table_bar_outlined),
              label: 'Tables',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.room_service_outlined),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

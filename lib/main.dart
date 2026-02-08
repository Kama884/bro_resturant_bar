import 'package:bro_resturant_bar/app/routes/app_pages.dart';
import 'package:bro_resturant_bar/app/routes/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN, // Suru ma login khulne

      getPages: AppPages.routes,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      //home: LoginPage(),
    );
  }
}

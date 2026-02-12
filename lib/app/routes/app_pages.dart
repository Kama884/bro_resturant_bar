import 'package:bro_resturant_bar/app/modules/auth/pages/login.dart';
import 'package:bro_resturant_bar/app/modules/auth/widgets/forgot_password_popup.dart';
import 'package:bro_resturant_bar/app/modules/auth/widgets/otp_popup.dart';
import 'package:bro_resturant_bar/app/modules/dashboard/pages/home_screen.dart';
import 'package:bro_resturant_bar/app/modules/dashboard/pages/main_wrapper.dart';
import 'package:bro_resturant_bar/app/modules/ordering/pages/food_screen.dart';
import 'package:bro_resturant_bar/app/modules/ordering/pages/order_info.dart';
import 'package:bro_resturant_bar/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.FORGOT_PASSWORD, page: () => ForgotPasswordPopup()),
    GetPage(name: Routes.OTP, page: () => OtpPopup()),
    GetPage(name: Routes.HOME_SCREEN, page: () => HomeScreen()),
    GetPage(name: Routes.MAIN_WRAPPER, page: () => MainWrapper()),
    GetPage(name: Routes.FOOD_SCREEN, page: () => foodScreen()),
    GetPage(name: Routes.ORDER_INFO, page: () => OrderInfo()),
  ];
}

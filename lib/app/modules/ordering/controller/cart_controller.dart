import 'package:bro_resturant_bar/app/modules/ordering/models/food_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Food>[].obs;

  int get totalItems =>
      cartItems.fold(0, (sum, item) => sum + item.quantity.value);

  double get totalPrice => cartItems.fold(
    0,
    (sum, item) => sum + (double.parse(item.price) * item.quantity.value),
  );

  void addToCart(Food food) {
    if (food.quantity.value == 0) {
      food.quantity.value = 1;
      cartItems.add(food);
    }
  }

  void increment(Food food) {
    food.quantity.value++;
    update();
    cartItems.refresh();
  }

  void decrement(Food food) {
    if (food.quantity.value > 0) {
      food.quantity.value--;
      if (food.quantity.value == 0) {
        cartItems.remove(food);
      }
      cartItems.refresh();
    }
  }

  double get Total => totalPrice;
  double get ServiceTax => totalPrice * 0.05;
  double get Vat => (totalPrice + ServiceTax) * 0.13;
  double get GrandTotal => totalPrice + ServiceTax + Vat;
}

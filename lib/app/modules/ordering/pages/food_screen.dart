import 'package:bro_resturant_bar/app/modules/ordering/controller/cart_controller.dart';
import 'package:bro_resturant_bar/app/modules/ordering/controller/food_controller.dart';
import 'package:bro_resturant_bar/app/modules/ordering/models/food_model.dart';
import 'package:bro_resturant_bar/app/modules/ordering/widgets/bottom_cart_bar.dart';
import 'package:bro_resturant_bar/app/modules/ordering/widgets/food_card.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class foodScreen extends StatelessWidget {
  const foodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final foodController = Get.put(FoodController());
    final cardController = Get.put(CartController());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Row(
          children: [
            Text(
              'Select Order',
              style: TextStyle(
                fontSize: 0.028.toresponsive(context),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 0.400.w(context)),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, size: 32, color: Colors.black),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildInfoBar(context),
          _buildSearchBar(context),

          _buildFilterTabs(context),

          SizedBox(height: 0.010.h(context)),

          Expanded(
            child: Obx(() {
              if (foodController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              final displayList = foodController.filteredFoodData;
              if (foodController.foodData.isEmpty) {
                return Center(child: Text('No Food Items Found'));
              }
              return _buildCategorizedFoodList(displayList, context);
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomCartBar(),
    );
  }

  _buildInfoBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.016.w(context),
        vertical: 0.02.h(context),
      ),
      child: Row(
        children: [
          Text(
            'Table: ',
            style: TextStyle(fontSize: 0.034.toresponsive(context)),
          ),
        ],
      ),
    );
  }

  _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.016.toresponsive(context),
        vertical: 0.02.toresponsive(context),
      ),
      child: SizedBox(
        height: 0.045.h(context),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search by table number or categories",
            hintStyle: TextStyle(
              fontSize: 0.026.toresponsive(context),
              color: Colors.grey,
            ),
            prefixIcon:
                // SizedBox();
                Icon(Icons.search, color: Colors.grey, size: 30),
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
    );
  }

  _buildFilterTabs(BuildContext context) {
    final foodController = Get.find<FoodController>();
    final Category = ['All', 'Momo', 'Briyani', 'Burger', 'Chowmine'];
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.016.toresponsive(context),
        vertical: 0.02.toresponsive(context),
      ),
      child: SizedBox(
        height: 0.040.h(context),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: Category.length,
          itemBuilder: (context, index) {
            return Obx(() {
              bool isSelected =
                  foodController.selectedCategory.value == Category[index];
              return GestureDetector(
                onTap: () => foodController.changeCategory(Category[index]),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue[900] : Colors.grey[100],
                    borderRadius: BorderRadius.circular(
                      0.020.toresponsive(context),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      Category[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }

  Widget _buildCategorizedFoodList(
    List<Foodmodel> displayList,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.016.toresponsive(context),
        vertical: 0.02.toresponsive(context),
      ),
      child: ListView.builder(
        itemCount: displayList.length,
        itemBuilder: (context, index) {
          final category = displayList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  category.category,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.builder(
                itemCount: category.food.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (context, foodIndex) {
                  return FoodCard(
                    foodData: category.food[foodIndex],
                    index: foodIndex,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:bro_resturant_bar/app/modules/dashboard/controller/table_controller.dart';
import 'package:bro_resturant_bar/app/modules/dashboard/models/table_model.dart';
import 'package:bro_resturant_bar/app/modules/dashboard/widgets/table_card.dart';
import 'package:bro_resturant_bar/utils/responsive.dart';
import 'package:bro_resturant_bar/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TableController());
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          _buildSearchBar(context),

          _buildFilterTabs(context),

          SizedBox(height: 0.010.h(context)),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              final displayList = controller.filteredTableData;
              if (controller.tableData.isEmpty) {
                return const Center(child: Text("No Tables Found"));
              }
              return _buildCategorizedList(displayList, context);
            }),
          ),
        ],
      ),
    );
  }

  _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.016.toresponsive(context),
        vertical: 0.05.toresponsive(context),
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
    final controller = Get.find<TableController>();
    final categories = ["All", "Ground Floor", "Cottage", "Hall Room"];
    return SizedBox(
      height: 0.045.h(context),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected =
                controller.selectedCategory.value == categories[index];
            return GestureDetector(
              onTap: () => controller.changeCategory(categories[index]),
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
                    categories[index],
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
    );
  }

  Widget _buildCategorizedList(
    List<Tablemodel> displayList,
    BuildContext context,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
              itemCount: category.table.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, tableIndex) {
                return TableCard(
                  tableData: category.table[tableIndex],
                  index: index,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

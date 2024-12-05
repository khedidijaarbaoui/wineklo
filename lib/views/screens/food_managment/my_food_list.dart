import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wineklo/views/screens/food_managment/add_new_item.dart';
import 'package:wineklo/views/themes/styles/colors.dart';
import 'package:wineklo/views/themes/styles/styles.dart'; // Import the styles

class FoodItem {
  final String name;
  final String details;
  final String price;
  final String category; // New category field

  FoodItem({
    required this.name,
    required this.details,
    required this.price,
    required this.category, // Include category in constructor
  });
}

class FoodMenuPage extends StatefulWidget {
  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}


class _FoodMenuPageState extends State<FoodMenuPage> {
  List<FoodItem> foodItems = [
    FoodItem(
      name: "Chicken Thai Biriyani",
      details: "This food is so tasty & delicious.",
      price: "60",
      category:"my cat"
    ),
  ];

  void addFoodItem(FoodItem newItem) {
    setState(() {
      foodItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9, // Number of tabs
      child: Scaffold(
        backgroundColor: whiteColor, // Set Scaffold background color
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: lightGrayColor, // Circle background
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back, color: blackColor),
            ),
          ),
          title: Text(
            "My Food List",
            style: blackHeadlineStyle, // Use black headline style
          ),
          centerTitle: true,
         bottom: TabBar(
  isScrollable: true,
  labelColor: darkOrangeColor,
  unselectedLabelColor: darkGrayColor,
  indicatorColor: darkOrangeColor,
  labelStyle: orangeSubheadingStyle,
  tabs: [
    Tab(text: "All"),
    Tab(text: "Favorites"),
    Tab(text: "Specials"),
    Tab(text: "Appetizers"),
    Tab(text: "Main Course"),
    Tab(text: "Desserts"),
    Tab(text: "Drinks"),
    Tab(text: "Vegetarian"),
    Tab(text: "Kids’ Menu"),
  ],
),

        ),
       body: TabBarView(
  children: [
    _buildFoodList(), // Show all food items
    _buildFoodList(category: "Favorites"), // Show Favorites items
    _buildFoodList(category: "Specials"), // Show Specials items
    _buildFoodList(category: "Appetizers"), // Show Appetizers
    _buildFoodList(category: "Main Course"), // Show Main Course
    _buildFoodList(category: "Desserts"), // Show Desserts
    _buildFoodList(category: "Drinks"), // Show Drinks
    _buildFoodList(category: "Vegetarian"), // Show Vegetarian items
    _buildFoodList(category: "Kids' Menu"), // Show Kids Menu items
  ],
),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final newItem = await Navigator.push<FoodItem>(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewItemsPage(),
              ),
            );

            // If a new item is returned, add it to the list
            if (newItem != null) {
              addFoodItem(newItem);
            }
          },
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: BorderSide(color: darkOrangeColor, width: 2.0),
          ),
          child: Icon(Icons.add, color: darkOrangeColor), // "+" icon with orange color
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

 Widget _buildFoodList({String? category}) {
  final filteredItems = category == null
      ? foodItems // Show all items if no category is specified
      : foodItems.where((item) => item.category == category).toList();

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Total Items Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            "Total ${filteredItems.length} items", // Update total items count
            style: placeholderTextStyle,
          ),
        ),
        // Food Items List
        ListView.builder(
          itemCount: filteredItems.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = filteredItems[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                color: whiteColor,
                child: ListTile(
                  contentPadding: EdgeInsets.all(12.0),
                  leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: lightGrayColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      
                    ),
                  title: Text(item.name, style: blackBodyTextStyle),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.details, style: grayBodyTextStyle),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: darkOrangeColor, size: 14),
                          SizedBox(width: 4),
                          Text("4.9", style: grayBodyTextStyle),
                          SizedBox(width: 4),
                          Text("(10 Reviews)", style: placeholderTextStyle),
                        ],
                      ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.more_vert, color: darkGrayColor),

                      Text(" ${item.price}  da", style: orangeBodyTextStyle),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    ),
  );
}

}

import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:wineklo/views/screens/food_managment/my_food_list.dart';
import 'package:wineklo/views/themes/styles/colors.dart';
import 'package:wineklo/views/themes/styles/styles.dart'; // Import your styles.dart file

class AddNewItemsPage extends StatefulWidget {
  @override
  State<AddNewItemsPage> createState() => _AddNewItemsPageState();
}

class _AddNewItemsPageState extends State<AddNewItemsPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  String? selectedCategory; // This defines the selected category

   final List<String> categories = [ // Define categories
    "Favorites", "Specials", "Appetizers", "Main Course", "Desserts", "Drinks", "Vegetarian", "Kids' Menu",
  ];// Controller for category
 


  File? _selectedImage; // State to store the selected image
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Item"),
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(6), // Adjust the padding to make the circle bigger or smaller
            decoration: BoxDecoration(
              color: Colors.grey[300], // Grey background color for the circle
              shape: BoxShape.circle, // Circle shape
            ),
            child: Icon(
              Icons.arrow_back,
              color: darkBlueColor, // Set arrow color
            ),
          ),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                nameController.clear();
                priceController.clear();
                detailsController.clear();
                categoryController.clear();
                _selectedImage = null;
              });
            },
            child: Text(
              "Reset",
              style: TextStyle(
                color: darkOrangeColor, // Use appropriate color for Reset text
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: defaultPadding, // Use the defaultPadding constant
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item Name Field
                Text(
                  "Item Name",
                  style: blackBodyTextStyle, // Use blackBodyTextStyle from styles.dart
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter item name",
                    hintStyle: grayBodyTextStyle, // Use grayBodyTextStyle from styles.dart
                  ),
                ),
                SizedBox(height: 20),

                // Upload Photo/Video
                Text(
                  "Upload Photo/Video",
                  style: blackBodyTextStyle, // Use blackBodyTextStyle from styles.dart
                ),
                SizedBox(height: 10),
                     GestureDetector(
  onTap: () {
    // Add functionality here if needed, or leave it empty for now
  },
  child: Container(
    width: 120,
    height: 120,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_upload_outlined,
            color: Colors.orange, // Adjust color as needed
            size: 40,
          ),
          SizedBox(height: 8),
          Text(
            "Add",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  ),
),

                
                SizedBox(height: 20),
                  // Category Field (Dropdown)
                Text("Category", style: blackBodyTextStyle),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Select category",
                  ),
                ),
                
                SizedBox(height: 20),

                // Item Price Field
                Text(
                  "Item Price",
                  style: blackBodyTextStyle, // Use blackBodyTextStyle from styles.dart
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "300 da",
                    hintStyle: grayBodyTextStyle, // Use grayBodyTextStyle from styles.dart
                  ),
                ),
                SizedBox(height: 20),

                // Details Field
                Text(
                  "Details",
                  style: blackBodyTextStyle, // Use blackBodyTextStyle from styles.dart
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: detailsController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Lorem ipsum dolor sit amet, consectetur adips cing elit. Bibendum in vel, mattis et amet dui mauris turpis.",
                    hintStyle: grayBodyTextStyle, // Use grayBodyTextStyle from styles.dart
                  ),
                ),
                SizedBox(height: 20),

                // Save Changes Button
                
                Center(
                child: ElevatedButton(
                  onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Create a new FoodItem and pass it back
                    final newItem = FoodItem(
                      name: nameController.text,
                      price: priceController.text,
                      details: detailsController.text,
                      category: selectedCategory!,
                    );
                    Navigator.pop(context, newItem);
                  }
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Use backgroundColor instead of primary
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 112.0),
                  ),
                  child: Text(
                    'SAVE CHANGES',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wineklo/views/themes/styles/colors.dart';
import 'package:wineklo/views/themes/styles/styles.dart'; // For the custom styles
import 'package:wineklo/views/screens/food_managment/edit_resto_profile.dart';
import 'package:wineklo/views/screens/food_managment/my_food_list.dart';
import 'package:wineklo/views/screens/food_managment/my_reviews.dart';



void main() => runApp(RestaurantViewApp());



class RestaurantViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Disable the debug banner
      home: RestaurantViewPage(),         // Your main page
    );
  }
}


class OpeningHoursCard extends StatelessWidget {
  final Map<String, String> openingHours;

  const OpeningHoursCard({
    required this.openingHours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: verticalPadding, // Use predefined padding
      padding: defaultPadding, // Use predefined padding
      decoration: cardDecoration, // Use predefined card decoration
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Opening Hours',
            style: headlineStyle, // Use predefined headline style
          ),
          SizedBox(height: 12.0), // Custom spacing
          ...openingHours.entries.map((entry) {
            return Padding(
              padding: smallPadding, // Use predefined small padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.key,
                    style: bodyTextStyle, // Use predefined body text style
                  ),
                  Text(
                    entry.value,
                    style: placeholderTextStyle, // Use predefined placeholder style
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}




class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: textLightGrayColor, // Use predefined chip background color
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: lightGrayColor, // Use predefined light gray for shadow
            offset: Offset(2, 2), // Shadow position
            blurRadius: 4.0, // Spread of the shadow
          ),
          BoxShadow(
            color: whiteColor, // Use predefined white color for opposite shadow
            offset: Offset(-2, -2), // Opposite shadow for a 3D look
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Text(
        label,
        style: placeholderTextStyle.copyWith(
          color: darkGrayColor, // Override color to use a darker gray for the text
          fontSize: 14.0, // Ensure font size matches the desired design
        ),
      ),
    );
  }
}





class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: smallPadding, // Use predefined small padding
      decoration: cardDecoration, // Use predefined card decoration
      child: Padding(
        padding: defaultPadding, // Use predefined default padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align left
          children: [
            // First Line: "Reviews" on left, "See all >" on right
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews',
                  style: bodyTextStyle.copyWith(color: darkOrangeColor), // Use predefined dark orange color
                ),
                GestureDetector(
                     onTap: () {
    // Navigate to the menu page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReviewsPage(), // Replace with your menu page widget
      ),
    );
  },
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          style: bodyTextStyle.copyWith(
                            color: darkOrangeColor, // Updated to darkOrangeColor
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: darkOrangeColor, size: 16.0),
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8.0),
            // Second Line: Star, Rating (4.7), and "Total 20 reviews"
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: darkOrangeColor, // Use predefined dark orange color
                  size: 20,
                ),
                SizedBox(width: 4.0),
                Text(
                  '4.7',
                  style: bodyTextStyle.copyWith(fontWeight: FontWeight.bold), // Bold for emphasis
                ),
                SizedBox(width: 8.0),
                Text(
                  'Total 20 reviews',
                  style: placeholderTextStyle, // Use placeholder text style
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}






class MenuCard extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String price;

  const MenuCard({
    Key? key,
    required this.imagePath,
    required this.itemName,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      margin: smallPadding, // Use predefined small padding
      decoration: cardDecoration, // Use predefined card decoration
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)), // Match `cardDecoration` radius
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity, // Ensure the image spans the width
              fit: BoxFit.fill, // Maintain aspect ratio and cover space
            ),
          ),
          SizedBox(height: 8.0),
          // Item Name
          Padding(
            padding: horizontalPadding, // Use predefined horizontal padding
            child: Text(
              itemName,
              style: bodyTextStyle.copyWith(fontWeight: FontWeight.bold), // Bold for emphasis
            ),
          ),
          SizedBox(height: 4.0),
          // Starting and Price in one line
          Padding(
            padding: horizontalPadding, // Use predefined horizontal padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Starting',
                  style: placeholderTextStyle, // Use placeholder text style
                ),
                Text(
                  '\$$price',
                  style: bodyTextStyle.copyWith(
                    color: darkOrangeColor, // Use predefined dark orange color
                    fontWeight: FontWeight.bold, // Bold for emphasis
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





class RestaurantViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor, // Updated to use whiteColor from your colors
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: whiteColor, // Updated to use whiteColor from your colors
          elevation: 0,
          leading: Container(
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: blackColor), 
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Text(
            'Restaurant View',
            style: headlineStyle.copyWith( // Use headlineStyle for consistency
              fontFamily: 'Sen', // Ensure the custom font is applied
            ),
          ),
          actions: [
            Container(
              margin: smallPadding,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightGrayColor,
              ),
              child: PopupMenuButton<String>(
                icon: Icon(Icons.more_horiz, color: blackColor),
                color: Colors.grey[200], // Set the background color of the popup menu
                onSelected: (String value) {
                  if (value == 'Edit Profile') {
                    // Navigate to the Edit Profile page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RestaurantEditPage()),
                    );
                  } else if (value == 'Log Out') {
                    // Perform log-out action
                    // Add log-out logic here
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'Edit Profile',
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontFamily: 'Noyh', // Apply custom font if desired
                        color: Colors.black,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'Log Out',
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontFamily: 'Noyh',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Restaurant Image
            Padding(
              padding: horizontalPadding.copyWith(top: 16.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Image.asset(
                    'assets/images/bg.png', // Update with your actual image path
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Restaurant Name and Description
            Padding(
              padding: horizontalPadding,
              child: Text(
                'Zeralda Restaurant',
                style: headlineStyle.copyWith(
                  fontSize: 24.0, // Keep the font size as defined in your styles
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: horizontalPadding,
              child: Text(
                'Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.',
                style: bodyTextStyle.copyWith(
                  fontSize: 14.0,
                  color: darkGrayColor, // Use darkGrayColor
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Rating, Location, and Pricing
            Padding(
              padding: horizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: darkOrangeColor, size: 20), // Updated to darkOrangeColor
                      SizedBox(width: 4),
                      Text(
                        '4.7',
                        style: headlineStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: darkOrangeColor, size: 20),
                      SizedBox(width: 4),
                      Text(
                        'Zeralda',
                        style: bodyTextStyle.copyWith(
                          color: darkGrayColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '\$\$\$',
                        style: bodyTextStyle.copyWith(
                          color: darkOrangeColor,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Pricing',
                        style: bodyTextStyle.copyWith(
                          color: darkGrayColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Category Section
            Padding(
              padding: horizontalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: subheadingStyle.copyWith(color: Colors.black), // Use subheadingStyle for the category title
                  ),
                  SizedBox(height: 8.0),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 8.0,
                    children: [
                      CategoryChip(label: 'Fast Food'),
                      CategoryChip(label: 'Casual Dining'),
                      CategoryChip(label: 'Calm'),
                      CategoryChip(label: 'Vegetarian'),
                      CategoryChip(label: 'Pet-Friendly'),
                    ],
                  ),
                ],
              ),
            ),
            // Menu Section
            SizedBox(height: 16.0),
            Padding(
              padding: horizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menu',
                    style: subheadingStyle.copyWith(
                      fontWeight: FontWeight.bold, color:Colors.black,  // Ensure the title is bold
                    ),
                  ),
                  GestureDetector(
                     onTap: () {
    // Navigate to the menu page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodMenuPage(), // Replace with your menu page widget
      ),
    );
  },
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          style: bodyTextStyle.copyWith(
                            color: darkOrangeColor, // Updated to darkOrangeColor
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: darkOrangeColor, size: 16.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MenuCard(
                    imagePath: 'assets/images/hiclipart 1.png',
                    itemName: 'Pizza',
                    price: '70',
                  ),
                  SizedBox(width: 16.0),
                  MenuCard(
                    imagePath: 'assets/images/hiclipart 1.png',
                    itemName: 'Burger',
                    price: '50',
                  ),
                  SizedBox(width: 16.0),
                  MenuCard(
                    imagePath: 'assets/images/hiclipart 1.png',
                    itemName: 'Pasta',
                    price: '60',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: horizontalPadding,
              child: ReviewCard(),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: OpeningHoursCard(
                openingHours: {
                  'Sunday': '9:00 AM - 10:00 PM',
                  'Monday': '9:00 AM - 10:00 PM',
                  'Tuesday': '9:00 AM - 10:00 PM',
                  'Wednesday': '9:00 AM - 10:00 PM',
                  'Thursday': '9:00 AM - 10:00 PM',
                  'Friday': '9:00 AM - 11:00 PM',
                  'Saturday': '9:00 AM - 11:00 PM',
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // For creating charts
import 'package:wineklo/views/screens/food_managment/add_new_item.dart';
import 'package:wineklo/views/screens/food_managment/edit_resto_profile.dart';
import 'package:wineklo/views/screens/food_managment/my_food_list.dart';
import 'package:wineklo/views/screens/food_managment/resto_profile.dart';
import 'package:wineklo/views/themes/styles/colors.dart';
import 'package:wineklo/views/themes/styles/styles.dart';

import 'package:wineklo/views/screens/food_managment/my_reviews.dart'; // Import your styles.dart file




class RestaurantDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: RestaurantDashboardPage(), // Your main dashboard page
    );
  }
}

class RestaurantDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant Home',
          style: headlineStyle,
        ),
        backgroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        padding: defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Message
            Text(
              'Welcome Back salahs restau!',
              style: subheadingStyle.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 16.0),

            // Quick Access Buttons
            Container(
              decoration: cardDecoration,
              padding: defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Access',
                    style: subheadingStyle,
                  ),
                  const SizedBox(height: 16.0),
                 GridView.count(
  crossAxisCount: 2,
  shrinkWrap: true,
  mainAxisSpacing: 16.0,
  crossAxisSpacing: 16.0,
  physics: NeverScrollableScrollPhysics(),
  children: [
    _buildQuickAccessButton(context, 'Profile', Icons.person, darkOrangeColor, RestaurantViewApp()),
    _buildQuickAccessButton(context, 'Edit Profile', Icons.edit, lightOrangeColor, RestaurantEditPage()),
    _buildQuickAccessButton(context, 'Food List', Icons.fastfood, darkBlueColor, FoodMenuPage()),
    _buildQuickAccessButton(context, 'Add New Item', Icons.add, darkGrayColor, AddNewItemsPage()),
  ],
),

                ],
              ),
            ),

            const SizedBox(height: 24.0),

            // Card for Review Statistics
            Container(
              decoration: cardDecoration,
              padding: defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Review Statistics',
                    style: subheadingStyle,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Average rating: 4.5/5',
                    style: bodyTextStyle,
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: lightOrangeColor,
                            value: 60,
                            title: '60%',
                            titleStyle: buttonTextStyle,
                          ),
                          PieChartSectionData(
                            color: darkOrangeColor,
                            value: 30,
                            title: '30%',
                            titleStyle: buttonTextStyle,
                          ),
                          PieChartSectionData(
                            color: lightGrayColor,
                            value: 10,
                            title: '10%',
                            titleStyle: buttonTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24.0),

            // Review Comments Section
            Container(
              decoration: cardDecoration,
              padding: defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Review Comments',
                    style: subheadingStyle,
                  ),
                  const SizedBox(height: 16.0),
                  ListView.builder(
                    itemCount: 3, // Display first 3 comments
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        padding: defaultPadding,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: lightGrayColor,
                              blurRadius: 4.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'khadidjalastar - 12/01/2024',
                              style: subheadingStyle.copyWith(color: Colors.black),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Great service and delicious food!',
                              style: bodyTextStyle,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
  onTap: () {
    // Navigate to the ReviewsPage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReviewsPage(), // Replace with your actual page
      ),
    );
  },
  child: Row(
    mainAxisSize: MainAxisSize.min, // Adjust size to fit content
    children: [
      Text(
        'See All',
        style: bodyTextStyle.copyWith(
          color: darkOrangeColor,
          fontWeight: FontWeight.bold, // Optional for emphasis
        ),
      ),
      const SizedBox(width: 4.0), // Space between text and icon
      Icon(
        Icons.arrow_forward,
        color: darkOrangeColor,
        size: 16.0,
      ),
    ],
  ),
),


                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildQuickAccessButton(BuildContext context, String label, IconData icon, Color color, Widget targetPage) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => targetPage, // Directly navigate to the target page
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 32.0),
          const SizedBox(height: 8.0),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    ),
  );
}

}
import 'package:flutter/material.dart';
import 'package:wineklo/views/screens/food_managment/add_new_item.dart';
import 'package:wineklo/views/screens/food_managment/my_food_list.dart';
import 'package:wineklo/views/screens/food_managment/edit_resto_profile.dart';
import 'package:wineklo/views/screens/food_managment/my_reviews.dart';
import 'package:wineklo/views/screens/food_managment/resto_profile.dart';
import 'package:wineklo/views/screens/food_managment/home.dart';

import 'package:wineklo/views/themes/styles/colors.dart';

class userNavBar extends StatefulWidget {
    const userNavBar ({super.key});
    @override
    State<userNavBar> createState() => _userNavBarState();
}

class _userNavBarState extends State<userNavBar> {

  int _selectedindex = 0;

  List<Widget> screens = [
 
  
  RestaurantDashboardApp(), // Placeholder for Favorites
  ReviewsPage(),
  FoodMenuPage(), // Add your Food Menu Page here
  RestaurantViewApp(), // Placeholder for Profile

];


  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: screens[_selectedindex],
          bottomNavigationBar: NavigationBar(
            overlayColor: null,
            indicatorColor: Colors.transparent,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              height: 70,
              elevation: 0,
              selectedIndex: _selectedindex,
                destinations: [
                    NavigationDestination(
                        icon: Icon(
                          Icons.home,
                          color: _selectedindex == 0 ? darkOrangeColor : Colors.grey), 
                        label: ""),//homepage
                        NavigationDestination(
                        icon: Icon(
                          Icons.star,
                          color: _selectedindex == 1 ? darkOrangeColor : Colors.grey), 
                        label: ""), //favorites

                    NavigationDestination(
                        icon: Icon(
                          Icons.menu_book,
                          color: _selectedindex == 2 ? darkOrangeColor : Colors.grey), 
                        label: "",), //menu page
                    
                    NavigationDestination(
                        icon: Icon(
                          Icons.account_box_outlined,
                          color: _selectedindex == 3 ? darkOrangeColor : Colors.grey), 
                        label: ""), //profile
                ],
              onDestinationSelected: (index) => {
                setState(() {
                  _selectedindex = index;
                })
              },
            ),
        );
    }
}


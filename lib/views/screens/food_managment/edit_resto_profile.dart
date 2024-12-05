import 'package:flutter/material.dart';
import 'package:wineklo/views/themes/styles/colors.dart';
import 'package:wineklo/views/themes/styles/styles.dart'; // Import your styles.dart file





class CategoriesSelection extends StatefulWidget {
  @override
  _CategoriesSelectionState createState() => _CategoriesSelectionState();
}

class _CategoriesSelectionState extends State<CategoriesSelection> {
  String? selectedCategory;

  final List<String> categories = [
    'ALL',
    'TURKISH',
    'CHINESE',
    'ITALIAN',
    'JAPANESE',
    'SYRIAN',
    'INDIAN',
    'MEXICAN',
    'OTHER',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CATEGORIES',
              style: subheadingStyle,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  selectedCategory = null; // Clear selection
                });
              },
              child: Text(
                'CLEAR ALL',
                style: TextStyle(color: blackColor),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Wrap(
          spacing: 12.0, // Space between buttons horizontally
          runSpacing: 12.0, // Space between rows
          children: categories.map((category) {
            final isSelected = selectedCategory == category;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category; // Update selection
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: isSelected ? darkOrangeColor : lightGrayColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? whiteColor : blackColor,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class RestaurantEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: lightGrayColor,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: blackColor),
              onPressed: () {},
            ),
          ),
          title: Text(
            'Restaurant View',
            style: TextStyle(
              fontFamily: 'Sen',
              color: blackColor,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightGrayColor,
              ),
              child: IconButton(
                icon: Icon(Icons.more_horiz, color: blackColor),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restaurant Name Label
              Text(
                'RESTAURANT NAME',
                style: placeholderTextStyle,
              ),
              SizedBox(height: 8.0),
              // Dropdown for Restaurant Name
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: lightGrayColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: lightGrayColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: darkOrangeColor),
                  ),
                ),
                items: ['Zeralda Restaurant', 'Restaurant A', 'Restaurant B']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: bodyTextStyle),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle selection
                },
              ),
              SizedBox(height: 16.0),
              // Location Label
              Text(
                'LOCATION',
                style: placeholderTextStyle,
              ),
              SizedBox(height: 8.0),
              // Location TextField
              TextFormField(
                initialValue: 'Zeralda',
                decoration: InputDecoration(
                  filled: true,
                  fillColor: lightGrayColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: lightGrayColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: darkOrangeColor),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Opening Hours Section
              Text(
                'OPENING HOURS',
                style: headlineStyle,
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: lightGrayColor,
                        ),
                        child: Text(
                          'DAYS',
                          style: bodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: lightGrayColor,
                        ),
                        child: Text(
                          'OPENING-CLOSING',
                          style: bodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            margin: EdgeInsets.symmetric(vertical: 4.0),
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: lightGrayColor,
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Day ${index + 1}',
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 40,
                            margin: EdgeInsets.symmetric(vertical: 4.0),
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: lightGrayColor,
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Open-Close',
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              CategoriesSelection(),
              SizedBox(height: 16.0),
              Text(
                'UPLOAD PHOTO/VIDEO',
                style: headlineStyle,
              ),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  // Handle upload
                },
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: lightGrayColor, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: lightGrayColor,
                        child: Icon(Icons.cloud_upload, color: darkOrangeColor),
                      ),
                      SizedBox(height: 8.0),
                      Text('Add', style: TextStyle(color: darkGrayColor)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'DETAILS',
                style: headlineStyle,
              ),
              SizedBox(height: 8.0),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: lightGrayColor,
                  border: OutlineInputBorder(),
                  hintText: 'Enter your details',
                ),
                maxLines: 3,
              ),
              SizedBox(height: 32.0),

              // Save Changes Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save action
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
    );
  }
}

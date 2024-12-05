import 'package:flutter/material.dart';
import 'package:wineklo/views/themes/styles/colors.dart';
import 'package:wineklo/views/themes/styles/styles.dart';


class ReviewsPage extends StatelessWidget {
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Alice Smith',
      'review': 'Great experience! Highly recommended.',
      'date': '2024-07-25',
      'rating': 5, // Star rating (out of 5)
    },
    {
      'name': 'John Doe',
      'review': 'Excellent service and friendly staff.',
      'date': '2024-07-20',
      'rating': 4,
    },
    {
      'name': 'Maria Lopez',
      'review': 'Quality products and quick delivery!',
      'date': '2024-07-15',
      'rating': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews', style: blackHeadlineStyle),
        backgroundColor: whiteColor,
        centerTitle: true,
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
      ),
      body: Padding(
        padding: defaultPadding,
        child: ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final review = reviews[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: cardDecoration,
                child: Padding(
                  padding: smallPadding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Circle
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: lightGrayColor,
                        child: Text(
                          review['name']![0], // First letter of the name
                          style: whiteHeadlineStyle.copyWith(fontSize: 24),
                        ),
                      ),
                      SizedBox(width: 12.0), // Space between avatar and text
                      // Review Texts
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Star Rating
                           
                            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to start and end
  children: [
    // Reviewer's Name
    Text(
      review['name']!,
      style: blackSubHeadlineStyle,
    ),
    
    // Spacer pushes the three dots to the rightmost side
    PopupMenuButton<String>(
      onSelected: (value) {
        // Handle menu actions here (e.g., delete, report)
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'edit',
          child: Text('Edit'),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Text('Delete'),
        ),
      ],
      icon: Icon(Icons.more_vert, color: darkGrayColor),
    ),
  ],
),

                            SizedBox(height: 4.0),
                             Row(
                              children: List.generate(5, (starIndex) {
                                return Icon(
                                  starIndex < review['rating']
                                      ? Icons.star
                                      : Icons.star_border, // Filled or empty star
                                  color: darkOrangeColor,
                                  size: 20.0,
                                );
                              }),
                            ),
                            

                            SizedBox(height: 4.0),
                            Text(review['review']!, style: bodyTextStyle),
                            SizedBox(height: 8.0),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                review['date']!,
                                style: placeholderTextStyle,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

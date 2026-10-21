import 'package:flutter/material.dart';
import 'package:tisser_test_3/screens/course_detail_screen.dart';
import 'package:tisser_test_3/themes/colors.dart';
import 'package:tisser_test_3/themes/typo.dart';
import 'package:tisser_test_3/widgets/classitem.dart';
import 'package:tisser_test_3/widgets/pillButton.dart';

class ClassInProgessCard extends StatelessWidget {
  const ClassInProgessCard({super.key});

  @override
  Widget build(BuildContext context) {
    // No SafeArea here: HomeScreen already has one.
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor, // light grey, not pure white
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("CLASSES IN PROGRESS",
              style: Typo.sectionHeading.copyWith(color: Colors.black)),
          const SizedBox(height: 14),
          const ClassItem(number: '1', title: "Photography for Brands"),
          const ClassItem(number: '2', title: "Music Video Shooting"),
          const ClassItem(number: '3', title: "Street Photography"),
          const SizedBox(height: 18),
          Pillbutton(
            text: "VIEW ALL",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder:  
              (context) => CourseDetailScreen(),
              ),
              );
              },
            backgroundColor: AppColors.darkBackgroundColor,
            textColor: Colors.white,
            height: 56,
          ),
        ],
      ),
    );
  }
}
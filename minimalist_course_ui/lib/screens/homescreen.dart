import 'package:flutter/material.dart';
import 'package:tisser_test_3/screens/statistic_screen.dart';
import 'package:tisser_test_3/themes/colors.dart';
import 'package:tisser_test_3/themes/typo.dart';
import 'package:tisser_test_3/widgets/class_in_progess_card.dart';
import 'package:tisser_test_3/widgets/course_card.dart';

import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   int activeNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.darkBackgroundColor,
    extendBody: true,
    body: SafeArea(bottom: false,  
    child: ListView(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 110) ,
      children: [ClassInProgessCard(),
      SizedBox(height: 28,),
    
      Text("NEW CLASSES", style: Typo.sectionHeading.copyWith(color: Colors.white,
      letterSpacing: 0.8),
      ),
    
      SizedBox(height: 16,),
    
      Coursecard(text: " IMPROVE YOUR\n DRAWING SKILLS", 
      tags: ["ART","BEGINNER"],
       duration: "1 h 20m",
        backgroundColor: AppColors.warmMustardCardColor,
         textColor: AppColors.darkBackgroundColor, onTap: () {
        // Handle card tap
      },),
    
      SizedBox(height: 16,),
      Coursecard(text: " MUSIC VIDEO \n SHOOTING", 
      tags: ["FILMING","ADVANCED"], 
      duration: " 1 h 20m", 
      backgroundColor: AppColors.electricPurpleCardColor, 
      textColor: AppColors.darkBackgroundColor, onTap: () {
        // Handle card tap
      },
      ),
      ],
    ),
    ),
 
 bottomNavigationBar: BottomNavBar(
  activeIndex: activeNavIndex,
  onTabSelected : (i){
    if (i==3){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatisticsScreen(),));
    }
    setState(() 
      => activeNavIndex = i);
    },
    ),
    );
  }
}
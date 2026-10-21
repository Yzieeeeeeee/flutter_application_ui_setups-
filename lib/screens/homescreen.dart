import 'package:flutter/material.dart';
import 'package:tisser_application_test/themes/colors.dart';
import 'package:tisser_application_test/widgets/bottom_navigation.dart';
import 'package:tisser_application_test/widgets/category_selector.dart';
import 'package:tisser_application_test/widgets/destination_card.dart';
import 'package:tisser_application_test/widgets/home_header.dart';
import 'package:tisser_application_test/widgets/search_preview_section.dart';
import 'package:tisser_application_test/widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      extendBody: true,
      bottomNavigationBar: const FloatingBottomNav(),
      body: Stack(
        children: [
          SizedBox(
            height: 320,
            width: double.infinity,
            child: ShaderMask(
              shaderCallback: (rect) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
                stops: [0.5, 1],
              ).createShader(rect),
              blendMode: BlendMode.dstIn,
              child: Image.network(
                'https://static.vecteezy.com/system/resources/previews/000/742/601/large_2x/himalayas-mountain-landscape-photo.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(color: AppColors.skyTop),
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
              children: const [
                HomeHeader(),
                SizedBox(height: 22),
                SearchPreviewSection(),
                SizedBox(height: 18),
                CategorySelector(),
                SizedBox(height: 14),
                SectionHeader(),
                SizedBox(height: 4),
                DestinationCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
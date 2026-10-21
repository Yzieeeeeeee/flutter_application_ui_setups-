import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/destination_model.dart';
import '../models/travel_data.dart';
import '../themes/colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/category_tabs.dart';
import '../widgets/destination_banner_card.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/search_bar_widget.dart';
import 'location_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentIndex = 2; // South America (Rio de Janeiro)
  int _selectedBottomNav = 0;
  final Set<String> _favoriteIds = {};

  final List<String> _categories = [
    'Asia',
    'Europe',
    'South America',
    'North America',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
      viewportFraction: 0.78,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Navigation to LocationDetailsScreen
  void _openDetails(Destination destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationDetailsScreen(destination: destination),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // Header Widget
                const HomeHeaderWidget(),
                const SizedBox(height: 16),

                // Search Bar Widget
                const SearchBarWidget(),
                const SizedBox(height: 22),

                //  Section Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Select your next trip',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                //  Category Tabs Widget section
                CategoryTabs(
                  categories: _categories,
                  selectedIndex: _currentIndex,
                  onSelect: (index) {
                    setState(() => _currentIndex = index);
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                const SizedBox(height: 16),

                //  the carousel is performed here withe bannercard
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentIndex = index);
                    },
                    itemCount: appDestinations.length,
                    itemBuilder: (context, index) {
                      final dest = appDestinations[index];
                      return DestinationBannerCard(
                        destination: dest,
                        isFavorite: _favoriteIds.contains(dest.id),
                        onFavoriteToggle: () {
                          setState(() {
                            if (_favoriteIds.contains(dest.id)) {
                              _favoriteIds.remove(dest.id);
                            } else {
                              _favoriteIds.add(dest.id);
                            }
                          });
                        },
                        onTap: () => _openDetails(dest),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 110), // Bottom nav padding
              ],
            ),
          ),

          // 6. Floating Bottom Navigation Bar Widget
          BottomNavBar(
            selectedIndex: _selectedBottomNav,
            onSelect: (index) {
              setState(() => _selectedBottomNav = index);
            },
          ),
        ],
      ),
    );
  }
}

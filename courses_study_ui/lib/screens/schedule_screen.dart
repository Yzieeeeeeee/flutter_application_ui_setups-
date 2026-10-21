import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/mock_data.dart';
import '../models/calendar_day.dart';
import '../models/schedule_item.dart';
import '../widgets/schedule/calendar_strip.dart';
import '../widgets/schedule/schedule_fab_group.dart';
import '../widgets/schedule/schedule_timeline_card.dart';
import '../widgets/schedule/schedule_top_bar.dart';

class ScheduleScreen extends StatefulWidget {
  final List<CalendarDay>? days;
  final List<ScheduleItem>? scheduleItems;

  const ScheduleScreen({
    super.key,
    this.days,
    this.scheduleItems,
  });

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late List<CalendarDay> _days;
  late List<ScheduleItem> _items;
  int _selectedDayIndex = 3; // Wednesday by default

  @override
  void initState() {
    super.initState();
    _days = widget.days ?? MockData.weekDays;
    _items = widget.scheduleItems ?? MockData.scheduleItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ==========================================
          // LAYER 1: Properly Blurred Background & Right-Side Yellowish Tint
          // ==========================================
          _buildAtmosphericBackground(),

          // ==========================================
          // LAYER 2: Foreground Scrollable Content
          // ==========================================
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1. Top Bar: Back, Date Range Navigator, Bell
                  ScheduleTopBar(
                    dateRangeText: 'January 4-10',
                    onBack: () => Navigator.maybePop(context),
                    onNotificationTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Schedule Reminders enabled'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    onPreviousRange: () {},
                    onNextRange: () {},
                  ),
                  const SizedBox(height: 16),

                  // 2. Calendar Days Row with Neon Ring on Wed
                  CalendarStrip(
                    days: _days,
                    selectedIndex: _selectedDayIndex,
                    onDaySelected: (idx) {
                      setState(() => _selectedDayIndex = idx);
                    },
                  ),
                  const SizedBox(height: 24),

                  // 3. Schedule Subheading
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Center(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Schedule ',
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'Today, 15 Jan',
                              style: TextStyle(
                                color: AppColors.textGrey,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 4. Timeline Schedule Cards List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return ScheduleTimelineCard(
                        item: item,
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Selected "${item.title}"'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  // Spacing for floating action buttons
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          // ==========================================
          // LAYER 3: Floating Action Buttons (Edit & Add)
          // ==========================================
          Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: Center(
              child: ScheduleFabGroup(
                onEditTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Edit Schedule'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                onAddTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Add New Task / Class'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Atmospheric background with properly blurred glow circles and right-side yellowish/amber tint
  Widget _buildAtmosphericBackground() {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. Base dark background
        Container(
          color: AppColors.scaffoldBackground,
        ),

        // 2. Heavy gaussian blur layer for soft diffused ambient glows
        Positioned.fill(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
            child: Stack(
              children: [
                // Upper-right warm peach/amber diffusion (around top-right)
                Positioned(
                  top: 10,
                  right: -40,
                  child: Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.amberGlow.withValues(alpha: 0.32),
                    ),
                  ),
                ),

                // Center-right glowing magenta / rose / purple orb
                Positioned(
                  top: 140,
                  right: -80,
                  child: Container(
                    width: 320,
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFBD387C).withValues(alpha: 0.45),
                    ),
                  ),
                ),

                // Lower-right yellowish-amber warm glowing circle (matching reference image)
                Positioned(
                  bottom: 80,
                  right: -60,
                  child: Container(
                    width: 280,
                    height: 360,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.amberGlow.withValues(alpha: 0.52),
                    ),
                  ),
                ),

                // Extra subtle warm yellow accent bleeding from bottom-right edge
                Positioned(
                  bottom: 140,
                  right: -20,
                  child: Container(
                    width: 180,
                    height: 240,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.warmYellow.withValues(alpha: 0.40),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 3. Right-edge soft gradient wash for seamless golden-yellowish lighting
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          width: 180,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  AppColors.amberGlow.withValues(alpha: 0.28),
                  AppColors.warmYellow.withValues(alpha: 0.12),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.48, 1.0],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
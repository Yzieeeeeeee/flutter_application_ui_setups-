import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tisser_test_3/themes/colors.dart';
import 'package:tisser_test_3/themes/typo.dart';
import 'package:tisser_test_3/widgets/pillButton.dart';
import 'package:tisser_test_3/widgets/stati_card.dart';
import 'package:tisser_test_3/widgets/stati_week_cart.dart';
import 'package:tisser_test_3/widgets/stats_tile.dart';

class StatisticsScreen extends StatefulWidget {
  /// Hours watched per day, Sunday -> Saturday
  final List<double> weekHours;
  final String classesWatched;
  final String totalTime;
  final String averageTime;

  const StatisticsScreen({
    super.key,
    this.weekHours = const [1.8, 3.0, 2.2, 1.8, 2.45, 0.95, 1.58],
    this.classesWatched = '18',
    this.totalTime = '37H',
    this.averageTime = '1,4H',
  });

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  static const _days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  late int _selected;

  @override
  void initState() {
    super.initState();
    // highlight the busiest day by default
    final max = widget.weekHours.reduce((a, b) => a > b ? a : b);
    _selected = widget.weekHours.indexOf(max);
  }

  String get _weekTotal {
    final minutes =
        (widget.weekHours.fold<double>(0, (a, b) => a + b) * 60).round();
    return '${minutes ~/ 60}H ${minutes % 60}M';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            // Header
            Row(
              children: [
                Material(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => Navigator.of(context).maybePop(),
                    child: const SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(Icons.arrow_back,
                          color: AppColors.darkBackgroundColor, size: 22),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Text('STATISTICS',
                    style: GoogleFonts.anton(
                        fontSize: 46, height: 1.0, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 18),

            // THIS WEEK card
            StatiCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('THIS WEEK',
                          style: Typo.sectionHeading.copyWith(
                              fontSize: 22,
                              color: AppColors.darkBackgroundColor)),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.darkBackgroundColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(_weekTotal,
                            style: Typo.buttonText
                                .copyWith(fontSize: 13, color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  WeekChart(
                    hours: widget.weekHours,
                    days: _days,
                    selected: _selected,
                    onSelect: (i) => setState(() => _selected = i),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // ALL TIME card
            StatiCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ALL TIME',
                      style: Typo.sectionHeading.copyWith(
                          fontSize: 22, color: AppColors.darkBackgroundColor)),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                          child: StatsTile(
                              label: 'CLASSES\nWATCHED',
                              value: widget.classesWatched)),
                      const SizedBox(width: 8),
                      Expanded(
                          child: StatsTile(
                              label: 'TOTAL TIME', value: widget.totalTime)),
                      const SizedBox(width: 8),
                      Expanded(
                          child: StatsTile(
                              label: 'AVERAGE TIME\nPER DAY',
                              value: widget.averageTime)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Pillbutton(
                    text: 'VIEW DETAILS',
                    backgroundColor: AppColors.darkBackgroundColor,
                    textColor: Colors.white,
                    height: 56,
                    onPressed: () {
                      
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}








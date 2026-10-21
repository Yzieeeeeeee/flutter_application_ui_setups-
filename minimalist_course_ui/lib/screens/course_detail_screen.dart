import 'package:flutter/material.dart';
import 'package:tisser_test_3/themes/colors.dart';
import 'package:tisser_test_3/themes/typo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tisser_test_3/widgets/course_circle_icon.dart';
import 'package:tisser_test_3/widgets/course_segmented_toggling.dart';
import 'package:tisser_test_3/widgets/course_stat_card.dart';
import 'package:tisser_test_3/widgets/course_video_prev.dart';

class CourseDetailScreen extends StatefulWidget {
  final String title;
  final String imagePath;
  final String language;
  final String duration;
  final String level;
  final Color accentColor;
  final List<String> requirements;

  const CourseDetailScreen({
    super.key,
    this.title = 'PORTRAIT\nPHOTOGRAPHY',
    this.imagePath = 'https://picsum.photos/seed/portrait/900/700',
    this.language = 'ENGLISH',
    this.duration = '3H15M',
    this.level = 'BEGINNER',
    this.accentColor = AppColors.coralRedCardColor,
    this.requirements = const [
      'A DSLR or mirrorless camera',
      'A 50mm or 85mm lens',
      'A softbox or any soft light source',
    ],
  });

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _tab = 0; // 0 = details, 1 = requirements
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.accentColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
          children: [
            // Top row: back + favourite
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleIconButton(
                  icon: Icons.arrow_back,
                  onTap: () => Navigator.of(context).maybePop(),
                ),
                CircleIconButton(
                  icon: _liked ? Icons.favorite : Icons.favorite_border,
                  onTap: () => setState(() => _liked = !_liked),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Main light card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.lightBackgroundColor,
                borderRadius: BorderRadius.circular(36),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.title.toUpperCase(),
                        style: GoogleFonts.anton(
                          fontSize: 64,
                          height: 1.0,
                          color: AppColors.darkBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  VideoPreview(
                    imagePath: widget.imagePath,
                    playColor: widget.accentColor,
                    onPlay: () {
                      // the fake play button is this 
                    },
                  ),
                  const SizedBox(height: 12),
                  SegmentedToggle(
                    labels: const ['DETAILS', 'REQUIREMENTS'],
                    selected: _tab,
                    onChanged: (i) => setState(() => _tab = i),
                  ),
                  const SizedBox(height: 12),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: _tab == 0
                        ? _buildDetails()
                        : _buildRequirements(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Row(
      key: const ValueKey('details'),
      children: [
        Expanded(child: CourseStatCard(label: 'LANGUAGE', value: widget.language)),
        const SizedBox(width: 8),
        Expanded(child: CourseStatCard(label: 'DURATION', value: widget.duration)),
        const SizedBox(width: 8),
        Expanded(child: CourseStatCard(label: 'LEVEL', value: widget.level)),
      ],
    );
  }

  Widget _buildRequirements() {
    return Container(
      key: const ValueKey('requirements'),
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final r in widget.requirements)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Icon(Icons.check_circle,
                        size: 18, color: AppColors.darkBackgroundColor),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(r,
                        style: Typo.classItem
                            .copyWith(color: AppColors.darkBackgroundColor)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}







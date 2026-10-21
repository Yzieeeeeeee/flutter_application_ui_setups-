import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/colors.dart';

class SwipeSlider extends StatefulWidget {
  final VoidCallback onSwipeComplete;

  const SwipeSlider({
    super.key,
    required this.onSwipeComplete,
  });

  @override
  State<SwipeSlider> createState() => _SwipeSliderState();
}

class _SwipeSliderState extends State<SwipeSlider> {
  double _dragX = 0.0;
  final double _knobSize = 46.0;
  final double _padding = 5.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxDrag = constraints.maxWidth - _knobSize - (_padding * 2);

        return GestureDetector(
          onTap: widget.onSwipeComplete,
          onHorizontalDragUpdate: (details) {
            setState(() {
              _dragX = (_dragX + details.delta.dx).clamp(0.0, maxDrag);
            });
          },
          onHorizontalDragEnd: (details) {
            if (_dragX > maxDrag * 0.45 || (details.primaryVelocity ?? 0) > 200) {
              widget.onSwipeComplete();
            }
            setState(() {
              _dragX = 0.0;
            });
          },
          child: Container(
            height: 56,
            padding: EdgeInsets.all(_padding),
            decoration: BoxDecoration(
              color: AppColors.sliderBackground,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // "See more" text
                Center(
                  child: Text(
                    'See more',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Draggable circular white knob
                Positioned(
                  left: _dragX,
                  child: Container(
                    width: _knobSize,
                    height: _knobSize,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.dark,
                      size: 26,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

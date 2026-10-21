import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../common/circular_icon_button.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VoidCallback? onBack;
  final VoidCallback? onBookmark;

  const VideoPlayerWidget({
    super.key,
    this.onBack,
    this.onBookmark,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  double _sliderValue = 0.44;
  String _playbackSpeed = '1x';

  final List<String> _speeds = ['1x', '1.25x', '1.5x', '2x'];

  void _cycleSpeed() {
    setState(() {
      int nextIndex = (_speeds.indexOf(_playbackSpeed) + 1) % _speeds.length;
      _playbackSpeed = _speeds[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.scaffoldBackground,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Video background image (Instructor in studio with mic & warm purple/brick vibe)
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Image.network(
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=1000&q=80',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF35203D), Color(0xFF1B1424)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.videocam_rounded, size: 64, color: Colors.white24),
                  ),
                );
              },
            ),
          ),

          // Vignette & gradient shadows for readability
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.55),
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.25),
                  Colors.black.withValues(alpha: 0.85),
                ],
                stops: const [0.0, 0.25, 0.65, 1.0],
              ),
            ),
          ),

          // Top Header Action Bar (Back & Bookmark)
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularIconButton(
                  icon: Icons.arrow_back_rounded,
                  onTap: widget.onBack ?? () => Navigator.maybePop(context),
                  backgroundColor: Colors.black.withValues(alpha: 0.35),
                ),
                CircularIconButton(
                  icon: Icons.bookmark_border_rounded,
                  onTap: widget.onBookmark,
                  backgroundColor: Colors.black.withValues(alpha: 0.35),
                ),
              ],
            ),
          ),

          // Timestamp overlay ("12:18 / 28:00")
          Positioned(
            bottom: 74,
            right: 24,
            child: Text(
              '12:18 / 28:00',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),

          // Bottom Video Control Bar
          Positioned(
            bottom: 16,
            left: 20,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      // 1x Speed pill
                      GestureDetector(
                        onTap: _cycleSpeed,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(
                            _playbackSpeed,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      // Slider with custom thumb
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 3.5,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.white.withValues(alpha: 0.3),
                            thumbColor: Colors.white,
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
                            trackShape: const RectangularSliderTrackShape(),
                          ),
                          child: Slider(
                            value: _sliderValue,
                            onChanged: (val) {
                              setState(() {
                                _sliderValue = val;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Fullscreen Icon
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.crop_free_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

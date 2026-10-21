import 'package:flutter/material.dart';

class VideoPreview extends StatelessWidget {
  final String imagePath;
  final Color playColor;
  final VoidCallback onPlay;
  const VideoPreview({
    required this.imagePath,
    required this.playColor,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: SizedBox(
        height: 230,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imagePath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) => progress == null
                  ? child
                  : Container(color: const Color(0xFF2A2B30)),
              errorBuilder: (_, __, ___) =>
                  Container(color: const Color(0xFF2A2B30)),
            ),
            Center(
              child: Material(
                color: Colors.white,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onPlay,
                  child: SizedBox(
                    width: 72,
                    height: 72,
                    child: Icon(Icons.play_arrow_rounded,
                        color: playColor, size: 38),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
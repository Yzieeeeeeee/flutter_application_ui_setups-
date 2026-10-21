import 'package:flutter/material.dart';
import 'package:tisser_test_3/themes/typo.dart';

class ClassItem extends StatelessWidget {
  final String number;
  final String title;
  final VoidCallback? onTap;

  const ClassItem({
    super.key,
    required this.number,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Text(
                number,
                style: Typo.pillBadge.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(title,
                  overflow: TextOverflow.ellipsis,
                  style: Typo.classItem.copyWith(color: Colors.black)),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, size: 14, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tisser_test_3/themes/colors.dart';
import 'package:tisser_test_3/themes/typo.dart';

class SegmentedToggle extends StatelessWidget {
  final List<String> labels;
  final int selected;
  final ValueChanged<int> onChanged;
  const SegmentedToggle({
    required this.labels,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.darkBackgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: List.generate(labels.length, (i) {
          final isSel = i == selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSel ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  labels[i],
                  style: Typo.buttonText.copyWith(
                    fontSize: 13,
                    color: isSel ? AppColors.darkBackgroundColor : Colors.white,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

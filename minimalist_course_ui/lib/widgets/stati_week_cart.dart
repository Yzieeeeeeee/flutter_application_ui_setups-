import 'package:flutter/material.dart';
import 'package:tisser_test_3/themes/colors.dart';
import 'package:tisser_test_3/themes/typo.dart';
import 'package:tisser_test_3/widgets/stati_grid_painter.dart';

class WeekChart extends StatelessWidget {
  final List<double> hours;
  final List<String> days;
  final int selected;
  final ValueChanged<int> onSelect;

  const WeekChart({
    required this.hours,
    required this.days,
    required this.selected,
    required this.onSelect,
  });

  static const double _maxHours = 3.0;
  static const double _plotH = 200;
  static const double _topPad = 10;
  static const double _leftPad = 34;

  double _y(double h) => _topPad + _plotH * (1 - h / _maxHours);

  @override
  Widget build(BuildContext context) {
    const dark = AppColors.darkBackgroundColor;
    return Column(
      children: [
        SizedBox(
          height: _topPad + _plotH,
          child: Stack(
            children: [
              // Bars
              Positioned.fill(
                left: _leftPad,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(hours.length, (i) {
                    final isSel = i == selected;
                    return Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => onSelect(i),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            width: 38,
                            height: _plotH * hours[i] / _maxHours,
                            decoration: BoxDecoration(
                              color: isSel ? dark : const Color(0xFFD0D0D3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              // Dashed grid lines on top of bars (IgnorePointer so taps pass through)
              Positioned.fill(
                child: IgnorePointer(
                  child: CustomPaint(
                    painter: GridPainter(
                      levels: const [1, 2, 3],
                      yOf: _y,
                      left: _leftPad,
                      color: dark.withValues(alpha: 0.75),
                    ),
                  ),
                ),
              ),
              // Axis labels
              for (final h in const [1, 2, 3])
                Positioned(
                  left: 0,
                  top: _y(h.toDouble()) - 8,
                  child: Text('$h h',
                      style: Typo.pillBadge
                          .copyWith(fontSize: 12, color: dark)),
                ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: _leftPad),
          child: Row(
            children: List.generate(days.length, (i) {
              return Expanded(
                child: Center(
                  child: Text(
                    days[i],
                    style: Typo.pillBadge.copyWith(
                      fontSize: 12,
                      fontWeight:
                          i == selected ? FontWeight.w700 : FontWeight.w500,
                      color: dark,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
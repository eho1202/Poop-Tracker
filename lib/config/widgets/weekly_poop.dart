import 'package:flutter/material.dart';

class WeeklyPoopCalendar extends StatelessWidget {
  final Map<DateTime, int> poopData;

  const WeeklyPoopCalendar({
    super.key,
    required this.poopData,
  });

  // Get the start of the current week (Sunday)
  DateTime get _startOfWeek {
    final now = DateTime.now();
    final weekday = now.weekday == 7 ? 0 : now.weekday; // Sunday = 0
    return DateTime(now.year, now.month, now.day)
        .subtract(Duration(days: weekday));
  }

  // Get color based on poop count
  Color _getColorForCount(int count) {
    if (count == 0) return Colors.grey[200]!;

    // Target color RGB values
    const targetR = 255;
    const targetG = 243;
    const targetB = 191;
    const targetA = 20;

    // Start from white (255, 255, 255)
    const startR = 255;
    const startG = 255;
    const startB = 255;

    // Calculate progression factor (0.0 to 1.0)
    // Cap at count 5 for maximum intensity
    double factor = (count / 4.0).clamp(0.0, 1.0);

    // Interpolate between start and target colors
    int r = (startR + (targetR - startR) * factor).round();
    int g = (startG + (targetG - startG) * factor).round();
    int b = (startB + (targetB - startB) * factor).round();

    return Color.fromARGB(r, g, b, targetA);
  }

  // Get date without time for comparison
  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  Widget build(BuildContext context) {
    final weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Week header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: weekDays
                .map((day) => Container(
                      width: 40,
                      child: Text(
                        day,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[300],
                        ),
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: 8),

          // Week row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              7,
              (index) {
                final date = _startOfWeek.add(Duration(days: index));
                final dateKey = _dateOnly(date);
                final poopCount = poopData[dateKey] ?? 0;
                final isToday = _dateOnly(DateTime.now()) == dateKey;

                return Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _getColorForCount(poopCount),
                    border: isToday
                        ? Border.all(
                            color: Colors.brown[700]!,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignOutside)
                        : Border.all(color: Colors.grey[300]!, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                        fontWeight:
                            isToday ? FontWeight.bold : FontWeight.normal,
                        color: poopCount > 2 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

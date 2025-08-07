import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MonthlyPoop extends StatefulWidget {
  final Map<DateTime, int> poopDatasets;

  const MonthlyPoop({
    super.key,
    this.poopDatasets = const {},
  });

  @override
  State<MonthlyPoop> createState() => _MonthlyPoopState();
}

class _MonthlyPoopState extends State<MonthlyPoop> {
  @override
  Widget build(BuildContext context) {
    // Sample data for testing - replace with actual data
    Map<DateTime, int> sampleData = {
      DateTime(2025, 7, 3): 1,
      DateTime(2025, 7, 7): 2,
      DateTime(2025, 7, 12): 1,
      DateTime(2025, 7, 15): 3,
      DateTime(2025, 7, 20): 2,
      DateTime(2025, 7, 23): 1,
      DateTime(2025, 7, 28): 4,
    };

    // Use passed data or fallback to sample data
    final datasets =
        widget.poopDatasets.isNotEmpty ? widget.poopDatasets : sampleData;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 16.0), // Reduced horizontal padding
      child: Container(
        width: double.infinity, // Extend full width
        padding: EdgeInsets.all(12), // Reduced internal padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Don't extend to bottom
          children: [
            HeatMapCalendar(
              defaultColor: Colors.grey[100]!,
              flexible: true,
              showColorTip: false,
              borderRadius: 50,
              colorMode: ColorMode.color,
              datasets: datasets,
              colorsets: {
                1: Color.fromARGB(255, 255, 235, 170),
                2: Color.fromARGB(255, 255, 220, 120),
                3: Color.fromARGB(255, 255, 205, 70),
                4: Color.fromARGB(255, 255, 190, 20),
              },
              textColor: Colors.black,
              monthFontSize: 18,
              weekFontSize: 12,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

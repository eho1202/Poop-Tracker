import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../config/widgets/monthly_poop.dart'; // Update this import path

class PoopCalendar extends StatefulWidget {
  const PoopCalendar({super.key});

  @override
  State<PoopCalendar> createState() => _PoopCalendarState();
}

class _PoopCalendarState extends State<PoopCalendar> {
  // Sample data - replace with your actual data source
  Map<DateTime, int> poopDatasets = {
    DateTime(2025, 7, 3): 1,
    DateTime(2025, 7, 7): 2,
    DateTime(2025, 7, 12): 1,
    DateTime(2025, 7, 15): 3,
    DateTime(2025, 7, 20): 2,
    DateTime(2025, 7, 23): 1,
    DateTime(2025, 7, 28): 4,
  };
  int recordedDays = 7;
  int recordedTimes = 14; // Updated to match total poops (1+2+1+3+2+1+4)

  void _onDayTapped(DateTime date) {
    final poopCount =
        poopDatasets[DateTime(date.year, date.month, date.day)] ?? 0;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${date.day}/${date.month}/${date.year}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(poopCount > 0
                ? 'Pooped $poopCount time${poopCount > 1 ? 's' : ''} on this day'
                : 'No poop records for this day'),
            SizedBox(height: 16),
            if (poopCount > 0)
              Text('💩' * poopCount, style: TextStyle(fontSize: 24)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Add functionality to add/edit poop record
              Navigator.pop(context);
            },
            child: Text('Edit'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button and title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '💩 Pooping Times',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 30), // Invisible spacer for balance
                ],
              ),
            ),

            // Statistics section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.all(20),
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
                      children: [
                        // Recorded Days row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.calendarDays),
                                SizedBox(width: 8),
                                Text(
                                  'Recorded Days',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '$recordedDays days',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),

                        // Recorded Times row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.calendarPlus),
                                SizedBox(width: 8),
                                Text(
                                  'Recorded Times',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '$recordedTimes times',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            Container(
              child: MonthlyPoop(
                poopDatasets: poopDatasets,
              ),
            ),

            Spacer(),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

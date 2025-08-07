import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poopoo/config/widgets/weekly_poop.dart';
import 'package:poopoo/pages/poop_calendar.dart';
import 'package:poopoo/pages/edit_poop.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

IconData _randomize_poop_icon() {
  final List<IconData> poopIcons = [
    FontAwesomeIcons.poo,
    FontAwesomeIcons.poop,
    FontAwesomeIcons.pooStorm,
  ]..shuffle();
  return poopIcons.first;
}

class _Home extends State<Home> {
  int _poopCount = 0;
  Map<DateTime, int> _heatMapDatasets = {};

  DateTime get _todaysDate {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  void _updateHeatMap() {
    setState(() {
      if (_poopCount > 0) {
        _heatMapDatasets[_todaysDate] = _poopCount;
      } else {
        _heatMapDatasets.remove(_todaysDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[600],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_poopCount.toString(),
                  style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900])),
              SizedBox(width: 20),
              Icon(_randomize_poop_icon(), size: 90, color: Colors.brown[900]),
            ],
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 88, 167, 241),
                  Color.fromARGB(255, 112, 180, 243),
                  Color.fromARGB(255, 146, 198, 247),
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                // Button row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (_poopCount > 0) {
                          _poopCount--;
                          _updateHeatMap();
                        }
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.remove_rounded,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _poopCount++;
                        _updateHeatMap();
                      },
                      child: const Icon(
                        Icons.add_circle_rounded,
                        size: 90,
                        color: Colors.blueAccent,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditPoop()),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          FontAwesomeIcons.penToSquare,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Calendar container
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PoopCalendar()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 140,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 70, 158, 240),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.withValues(alpha: 0.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: WeeklyPoopCalendar(poopData: _heatMapDatasets),
                  ),
                ),
                SizedBox(height: 160),
              ],
            ),
          )
        ],
      ),
    );
  }
}

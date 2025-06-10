import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _Friends();
}

class _Friends extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Friend #1',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Friend #2',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Friend',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.person_add_alt_rounded,
                          color: Colors.blue, size: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

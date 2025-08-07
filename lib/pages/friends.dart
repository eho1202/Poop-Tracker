import 'package:flutter/material.dart';
import '../config/widgets/add_friend.dart';

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
              ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: AddFriendBottomSheet(),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.white,
                  minimumSize: Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 3,
                ),
                icon: Icon(Icons.person_add_alt_rounded,
                    color: Colors.blue, size: 30),
                label: Text(
                  'Add Friend',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              SizedBox(width: 8),
            ],
          ),
        ),
      ],
    ));
  }
}

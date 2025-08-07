import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poopoo/config/widgets/toast_diag.dart';

String _friendCode = 'ABC123';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://example.com/profile_image.png',
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'name',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Clipboard.setData(new ClipboardData(text: _friendCode));
                        ToastDiag.show(
                          context,
                          message: 'Code copied!',
                        );
                      },
                      label: Text('Code $_friendCode'),
                      icon: Icon(FontAwesomeIcons.copy),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'toast_diag.dart';

class AddFriendBottomSheet extends StatefulWidget {
  const AddFriendBottomSheet({super.key});

  @override
  State<AddFriendBottomSheet> createState() => _AddFriendBottomSheetState();
}

String get _friendCode => 'ABC123';

class _AddFriendBottomSheetState extends State<AddFriendBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Friends',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Share your friend code with your friends',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              Clipboard.setData(new ClipboardData(text: _friendCode));
              ToastDiag.show(
                context,
                message: 'Code copied!',
              );
              Navigator.pop(context);
            },
            child: Text('Your code: $_friendCode'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

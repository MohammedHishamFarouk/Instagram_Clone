import 'package:flutter/material.dart';
import 'package:insgram_clone/view/navigationBar/profile/editProfile/custom_table.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 6),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Done',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
      body: const SingleChildScrollView(child: CustomTable()),
    );
  }
}

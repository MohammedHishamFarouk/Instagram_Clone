import 'package:flutter/material.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/core/style/color_manager.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 12.5),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(Assets.noProfile),
              radius: 47.5,
            ),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Change Profile Photo',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Divider(color: ColorManager.lightGrey),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            spacing: 5,
            children: [
              _NewTableRow(text1: 'Name       '),
              _NewTableRow(text1: 'UserName'),
              _NewTableRow(text1: 'Website    '),
              _NewTableRow(
                text1: 'Bio            ',
                borderColor: Colors.transparent,
              ),
            ],
          ),
        ),
        const Divider(
          color: ColorManager.lightGrey,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Switch to Professional Account',
            style: TextStyle(fontSize: 15),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 15),
          child: Text(
            'Private Information',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            spacing: 5,
            children: [
              _NewTableRow(text1: 'Email       '),
              _NewTableRow(text1: 'Phone      '),
              _NewTableRow(text1: 'Gender    '),
            ],
          ),
        ),
      ],
    );
  }
}

class _NewTableRow extends StatelessWidget {
  const _NewTableRow({
    required this.text1,
    this.borderColor = ColorManager.lightGrey,
  });

  final String text1;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        spacing: 50,
        children: [
          Text(
            text1,
            style: const TextStyle(fontSize: 15),
          ),
          Flexible(
            child: TextField(
              style: const TextStyle(
                fontSize: 15,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

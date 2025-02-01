import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/core/constants/assets.dart';
import 'package:insgram_clone/core/style/color_manager.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            spacing: 5,
            children: [
              _NewTableRow(
                text1: 'Name       ',
                controller: context.read<AuthCubit>().editName,
                maxLength: 30,
              ),
              _NewTableRow(
                text1: 'UserName',
                controller: context.read<AuthCubit>().editUserName,
                maxLength: 20,
              ),
              _NewTableRow(
                text1: 'Website    ',
                controller: context.read<AuthCubit>().editWebsite,
              ),
              _NewTableRow(
                text1: 'Bio            ',
                borderColor: Colors.transparent,
                maxLength: 100,
                controller: context.read<AuthCubit>().editBio,
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
              _NewTableRow(
                text1: 'Email       ',
                enabled: false,
              ),
              _NewTableRow(
                text1: 'Phone      ',
                enabled: false,
              ),
              _NewTableRow(
                text1: 'Gender    ',
                enabled: false,
              ),
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
    this.maxLength,
    this.controller,
    this.enabled = true,
  });

  final String text1;
  final Color borderColor;
  final int? maxLength;
  final TextEditingController? controller;
  final bool enabled;

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
              enabled: enabled,
              controller: controller,
              style: const TextStyle(
                fontSize: 15,
                height: 1.2,
              ),
              maxLines: null,
              inputFormatters: [
                LengthLimitingTextInputFormatter(maxLength),
              ],
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

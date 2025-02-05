import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    this.prefixImage,
    this.addPrefix = false,
    this.imageScale = 1,
    this.addSuffixIcon = false,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixTapped,
    required this.controller,
  });

  final String hintText;
  final String? prefixImage;
  final bool addPrefix;
  final bool addSuffixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final double imageScale;
  final TextEditingController controller;
  final VoidCallback? onSuffixTapped;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Form(
        // ToDo Color Switching
        child: TextFormField(
          controller: controller,
          // minLines: null,
          // maxLines: null,
          // expands: true,
          obscureText: obscureText,
          cursorColor: Colors.white70,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: addPrefix
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image(
                      image: ExactAssetImage(
                        prefixImage!,
                        scale: imageScale,
                      ),
                    ),
                  )
                : null,
            suffixIcon: addSuffixIcon
                ? IconButton(
                    onPressed: onSuffixTapped,
                    icon: suffixIcon!,
                  )
                : null,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white38),
            fillColor: Colors.grey.shade900,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.white30),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.white30),
            ),
          ),
          onChanged: (value) {
            context.read<AuthCubit>().textFieldFilled();
          },
        ),
      ),
    );
  }
}

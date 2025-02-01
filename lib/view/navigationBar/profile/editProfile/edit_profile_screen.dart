import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insgram_clone/modelView/authentication/auth_cubit.dart';
import 'package:insgram_clone/view/navigationBar/profile/editProfile/components/loading_overlay.dart';
import 'package:insgram_clone/view/navigationBar/profile/editProfile/custom_table.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>;
    String name = authCubit().editName.text;
    String userName = authCubit().editUserName.text;
    String website = authCubit().editWebsite.text;
    String bio = authCubit().editBio.text;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          Navigator.pop(context);
        } else if (state is EditProfileFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is EditProfileLoading;
        return LoadingOverlay(
          isLoading: isLoading,
          child: Scaffold(
            appBar: AppBar(
              leading: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  authCubit().editName.text = name;
                  authCubit().editUserName.text = userName;
                  authCubit().editWebsite.text = website;
                  authCubit().editBio.text = bio;
                },
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
                  onPressed: () =>
                      context.read<AuthCubit>().updaterUserDetails(),
                  child: const Text(
                    'Done',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            body: const SingleChildScrollView(child: CustomTable()),
          ),
        );
      },
    );
  }
}

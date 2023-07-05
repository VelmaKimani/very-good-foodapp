import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/authentication/google%20sign%20in/google_sign_in_cubit.dart';
import 'package:foodapp/utils/_index.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({super.key});

  @override
  State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ElevatedButton(
            onPressed: () {
              context.read<GoogleSignInCubit>().signInwithGoogle();
              Navigator.of(context).pushNamed(FoodAppRouter.successRoute);
            },
            child: const Text(
              'Sign Up with Google',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/screens/home/get_random_recipes_cubit.dart';
import 'package:foodapp/utils/_index.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have logged in successfully!!'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).restorablePushNamedAndRemoveUntil(
                    FoodAppRouter.ingredientsRoute, (route) => true);
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

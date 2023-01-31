import 'package:flutter/material.dart';
import 'package:foodapp/utils/_index.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have registered successfully!!'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    FoodAppRouter.ingredientsRoute, (route) => false);
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

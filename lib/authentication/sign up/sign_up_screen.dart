import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/authentication/sign%20up/sign_up_cubit.dart';
import 'package:foodapp/utils/_index.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = '';
  String email = '';
  String password = '';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.only(top: 200, right: 220),
                child: Text('Enter your name'),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(33, 97, 44, 250),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 5),
                child: TextFormField(
                  controller: nameController,
                  validator: (val) => val!.isEmpty ? 'Enter your name' : null,
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 220),
                child: Text('Enter your email'),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(33, 97, 44, 250),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 5),
                child: TextFormField(
                  controller: emailController,
                  validator: (val) => val!.isEmpty ? 'Enter your email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val.trim();
                    });
                  },
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.only(top: 10, right: 190),
                child: Text('Enter your password'),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(33, 97, 44, 250),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 10,
                  top: 5,
                ),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(border: InputBorder.none),
                  validator: (val) =>
                      val!.isEmpty ? 'Enter your password' : null,
                  onChanged: (val) {
                    setState(() {
                      password = val.trim();
                    });
                  },
                ),
              ),
            ),
            Container(
              width: 320,
              height: 70,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(63, 198, 198, 198),
                    offset: Offset(2, 4),
                    blurRadius: 10,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<SignUpCubit>().signUp(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        );
                    Navigator.of(context).pushNamed(FoodAppRouter.landingRoute);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

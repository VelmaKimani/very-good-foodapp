import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/authentication/login/login_cubit.dart';
import 'package:foodapp/utils/_index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            child: Padding(
              padding: EdgeInsets.only(top: 100, right: 220),
              child: Text('Enter your email'),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
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
                  decoration: const InputDecoration(border: InputBorder.none)),
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
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromARGB(33, 97, 44, 250),
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
                  }),
            ),
          ),
          Container(
            width: 350.0,
            height: 70.0,
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(63, 198, 198, 198),
                    offset: Offset(2.0, 4.0),
                    blurRadius: 10.0,
                  ),
                ],
                color: Colors.cyan),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ElevatedButton(
                onPressed: () {
                  final auth = FirebaseAuth.instance;
                  final user = auth.currentUser;

                  context.read<LoginCubit>().login(
                        email: emailController.text,
                        password: passwordController.text,
                      );

                  if (user != null) {
                    Navigator.of(context).pushNamed(FoodAppRouter.landingRoute);
                  } else {
                    showDialog(
                      context: context,
                      builder: (builder) => AlertDialog(
                        title: const Text("This email account does not exist."),
                        content: const Text(
                            " Please log in with an existing email account."),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("OK"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.cyan),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/_index.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            title: const Text('More'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search for recipes'),
            onTap: () {
              Navigator.pushNamed(context, FoodAppRouter.searchResultsRoute);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Sign Up'),
            onTap: () {
              Navigator.pushNamed(context, FoodAppRouter.signUpRoute);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Google Sign In'),
            onTap: () {
              Navigator.pushNamed(context, FoodAppRouter.googleSignInRoute);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              Navigator.pushNamed(context, FoodAppRouter.loginRoute);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              logOut();
              Navigator.pushNamed(context, FoodAppRouter.logoutRoute);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.receipt_rounded),
            title: const Text('Information Recipe'),
            onTap: () {
              Navigator.pushNamed(context, FoodAppRouter.informationRoute);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }

  Future<void> logOut() async {
    final firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
  }
}

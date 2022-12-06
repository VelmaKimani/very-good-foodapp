// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodapp/cubit/get_random_recipes_cubit.dart';
import 'package:foodapp/utils/_index.dart';

import '../models/_index.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<GetRandomRecipesCubit>().getRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          child: BlocBuilder<GetRandomRecipesCubit, GetRandomRecipesState>(
            builder: /*  (context, state) {
            return state.when(
              initial: CircularProgressIndicator.new,
              loading: CircularProgressIndicator.new,
              loaded: (recipes) => ListView.builder(
                itemCount: recipes!.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(recipes[index].title.toString()),
                  subtitle: Text(recipes[index].servings.toString()),
                ),
              ),
              error: Text.new,
            );
          }), */

                (context, state) {
              return state.when(
                initial: () => const Center(
                  child: Text('Loading'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (recipe) => Column(
                  children: [
                    Center(
                      child: Text(
                        recipe.title ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      height: MediaQuery.of(context).size.width * 0.55,
                      width: MediaQuery.of(context).size.height * 0.42,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'lib/assets/smoothy1.jpg',
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 1.438,
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    child: const Text(
                                      'Ingredients',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.18,
                                  ),
                                  Text(recipe.servings.toString()),
                                ],
                              ),
                              SizedBox(
                                height: 90,
                                child: Card(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  color: Theme.of(context).secondaryHeaderColor,
                                  child: ListTile(
                                    title: Text(
                                      recipe.title ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    leading: const Icon(
                                      Icons.restaurant_menu,
                                      color: Colors.green,
                                    ),
                                    trailing: Text(
                                      recipe.readyInMinutes.toString(),
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 220,
                                height: 70,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
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
                                  borderRadius: BorderRadius.circular(22),
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll<Color>(
                                        Colors.green,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        FoodAppRouter.instructionsRoute,
                                      );
                                    },
                                    child: const Text(
                                      'Start Cooking!',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                error: (String message) {
                  return const Text('Error displaying recipe');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

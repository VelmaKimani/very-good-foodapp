// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodapp/cubit/get_random_recipes_cubit.dart';
import 'package:foodapp/utils/_index.dart';

import '../models/_index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
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
            builder: (context, state) {
              return state.when(
                initial: () => const Center(
                  child: Text('Loading'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (recipes) => Column(
                  children: [
                    Center(
                      child: Text(
                        recipes[0].title!,
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
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(recipes[0].image!),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    child: Text(
                                      'Servings ${recipes[0].servings.toString()}',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 400,
                                child: ListView.builder(
                                  itemCount:
                                      recipes[0].extendedIngredients!.length,
                                  itemBuilder: (context, index) => SizedBox(
                                    height: 90,
                                    child: Card(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      child: ListTile(
                                        title: Text(
                                          recipes[0]
                                              .extendedIngredients![index]
                                              .name
                                              .toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        leading: Container(
                                          width: 50,
                                          height: 50,
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Image(
                                            fit: BoxFit.contain,
                                            image: NetworkImage(
                                              recipes[0]
                                                  .extendedIngredients![index]
                                                  .image!,
                                            ),
                                          ),
                                        ),
                                        trailing: Container(
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          child: Column(
                                            children: [
                                              const Text('amount'),
                                              Text(
                                                '${recipes[0].extendedIngredients![index].amount.toString()} ${recipes[0].extendedIngredients![index].unit}',
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.53,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(63, 198, 198, 198),
                                      offset: Offset(2, 4),
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const Center(
                                      child: Text(
                                        'Instructions',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 2,
                                        ),
                                        child: Text(recipes[0].instructions!),
                                      ),
                                    ),
                                  ],
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

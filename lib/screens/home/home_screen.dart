import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodapp/screens/home/get_random_recipes_cubit.dart';
import 'package:foodapp/screens/search/get_search_recipe_cubit.dart';
import 'package:foodapp/utils/_index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
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
    return Scaffold(
      body: SafeArea(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          recipes[0].title!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              FoodAppRouter.searchRoute,
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_right_alt_outlined,
                            size: 35,
                          ),
                        )
                      ],
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
                        height: MediaQuery.of(context).size.width * 1.375,
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
                              Column(
                                children: recipes[0]
                                    .extendedIngredients!
                                    .map(
                                      (ingredient) => SizedBox(
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
                                              ingredient.name.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            leading: Container(
                                              width: 50,
                                              height: 50,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10,
                                              ),
                                              child: Image(
                                                fit: BoxFit.contain,
                                                image: NetworkImage(
                                                  FoodAppConfig.instance!.values
                                                          .imagesUrl! +
                                                      ingredient.image!,
                                                ),
                                              ),
                                            ),
                                            trailing: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                vertical: 4,
                                              ),
                                              child: Column(
                                                children: [
                                                  const Text('amount'),
                                                  Text(
                                                    '${ingredient.amount.toString()} ${ingredient.unit}',
                                                    style: const TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/models/_index.dart';

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

  final TextEditingController searchController = TextEditingController();
  String searchWord = '';
  final List<Result> results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for recipe',
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              FoodAppRouter.searchResultsRoute,
                              arguments: searchController.text,
                            );
                          },
                          icon: const Icon(Icons.search),
                        ),
                      ),
                      onChanged: (search) {
                        setState(() {
                          searchWord = search;
                        });
                        context.read<GetSearchRecipeCubit>().getSearchRecipe(
                              seachItem: searchController.text,
                            );
                      },
                    ),
                  ),
                ),
                BlocBuilder<GetRandomRecipesCubit, GetRandomRecipesState>(
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
                          SizedBox(
                            height: 740,
                            child: ListView.builder(
                              itemCount: recipes.length,
                              itemBuilder: (context, index) => GestureDetector(
                                child: Card(
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          recipes[index].title!,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 10,
                                          top: 10,
                                        ),
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.42,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              recipes[index].image,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    FoodAppRouter.ingredients,
                                    arguments: recipes[index],
                                  );
                                },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

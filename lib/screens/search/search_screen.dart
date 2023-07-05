import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/screens/information/get_info_recipes_cubit.dart';
import 'package:foodapp/screens/search/get_search_recipe_cubit.dart';
import 'package:foodapp/utils/_index.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchWord = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text('Search for Recipes'),
      ),
      body: Column(
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
                onSubmitted: (value) {
                  final currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.unfocus();
                  }
                  value.isNotEmpty
                      ? context
                          .read<GetSearchRecipeCubit>()
                          .getSearchRecipe(name: searchController.text)
                      // ignore: unnecessary_statements
                      : null;
                },
                cursorColor: Colors.black,
                controller: searchController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search for recipe',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      final currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        currentFocus.unfocus();
                      }
                      context
                          .read<GetSearchRecipeCubit>()
                          .getSearchRecipe(name: searchController.text);
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
                onChanged: (search) {
                  setState(() {
                    searchWord = search;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<GetSearchRecipeCubit, GetSearchRecipeState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: Text('Type to search')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (results) => ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) => GestureDetector(
                      child: Card(
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                results[index].title!,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                bottom: 10,
                                top: 10,
                              ),
                              height: MediaQuery.of(context).size.width * 0.55,
                              width: MediaQuery.of(context).size.height * 0.42,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(32),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    results[index].image!,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        context.read<GetInfoRecipesCubit>().getInfoRecipes();
                        Navigator.of(context).pushNamed(
                          FoodAppRouter.informationRoute,
                          arguments: results[index],
                        );
                      },
                    ),
                  ),
                  error: (error) => Center(child: Text(error)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

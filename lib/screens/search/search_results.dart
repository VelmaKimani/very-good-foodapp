import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/screens/search/get_search_recipe_cubit.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  @override
  void initState() {
    context.read<GetSearchRecipeCubit>().getSearchRecipe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Searched Recipes'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<GetSearchRecipeCubit, GetSearchRecipeState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(
                  child: Text('Loading'),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (results) => SizedBox(
                  height: 760,
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) => Card(
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              results[index].title!,
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
                                image: NetworkImage(results[index].image!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                error: (String message) {
                  return const Text('Error displaying searched recipe');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

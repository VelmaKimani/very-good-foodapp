import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodapp/screens/search/get_search_recipe_cubit.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({
    super.key,
  });

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchWord = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text('Search for Recipes'),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: RefreshIndicator(
          onRefresh: () => context
              .read<GetSearchRecipeCubit>()
              .getSearchRecipe(name: searchController.text),
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
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
                      suffixIcon: const Icon(Icons.search),
                    ),
                    onChanged: (search) {
                      setState(() {
                        searchWord = search;
                      });
                      context
                          .read<GetSearchRecipeCubit>()
                          .getSearchRecipe(name: search);
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 1.5,
                    child:
                        BlocBuilder<GetSearchRecipeCubit, GetSearchRecipeState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () =>
                              const Center(child: Text('Type to search')),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          loaded: (results) => ListView.builder(
                            itemCount: results.length,
                            itemBuilder: (context, index) => GestureDetector(
                              child: Card(
                                color: Colors.red,
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
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.55,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.42,
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
                            ),
                          ),
                          error: (error) => Center(child: Text(error)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

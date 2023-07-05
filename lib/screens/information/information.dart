import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/l10n/l10n.dart';
import 'package:foodapp/screens/information/get_info_recipes_cubit.dart';
import 'package:foodapp/utils/_index.dart';

class Information extends StatefulWidget {
  const Information({
    super.key,
  });

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  void initState() {
    context.read<GetInfoRecipesCubit>().getInfoRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information Recipes'),
      ),
      body: SafeArea(
        child: ColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<GetInfoRecipesCubit, GetInfoRecipesState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () =>
                          const Center(child: Text('Type to search')),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      loaded: (result) => Column(
                        children: [
                          GestureDetector(
                            child: Card(
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      result.title!,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 10,
                                      top: 10,
                                    ),
                                    height: MediaQuery.of(context).size.width *
                                        0.55,
                                    width: MediaQuery.of(context).size.height *
                                        0.42,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(32),
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          result.image!,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(result.id.toString()),
                                  Text(result.servings.toString()),
                                  Text(result.aggregateLikes.toString()),
                                  Text(result.lowFodmap.toString()),
                                  Column(
                                    children: result.extendedIngredients!
                                        .map(
                                          (ingre) => SizedBox(
                                            height: 80,
                                            child: Card(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15,
                                                vertical: 10,
                                              ),
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                              child: ListTile(
                                                title: Text(
                                                  ingre.name.toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                leading: Container(
                                                  width: 50,
                                                  height: 50,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 10,
                                                  ),
                                                  child: Image(
                                                    fit: BoxFit.contain,
                                                    image: NetworkImage(
                                                      FoodAppConfig
                                                              .instance!
                                                              .values
                                                              .imagesUrl! +
                                                          ingre.image!,
                                                    ),
                                                  ),
                                                ),
                                                trailing: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 4,
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      const Text('amount'),
                                                      Text(
                                                        AppLocalizations.of(
                                                          context,
                                                        )!
                                                            .ingredient(
                                                          '${ingre.amount}',
                                                          ingre.unit!,
                                                        ),
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
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.height * 0.53,
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
                                    child: Text(
                                      result.summary!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      error: (error) => Center(child: Text(error)),
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

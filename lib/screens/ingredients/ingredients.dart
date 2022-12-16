// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodapp/models/_index.dart';
import 'package:foodapp/screens/home/get_random_recipes_cubit.dart';
import 'package:foodapp/utils/_index.dart';

class Ingredients extends StatefulWidget {
  const Ingredients({
    Key? key,
    required this.recipes,
    required this.extendedIngredients,
  }) : super(key: key);

  final List<Recipe> recipes;
  final List<ExtendedIngredient> extendedIngredients;

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingredients'),
      ),
      body: Container(
        height: 400,
        color: Colors.red,
        child: ListView.builder(
          itemCount: widget.extendedIngredients.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            color: Colors.blue,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        'Servings ${widget.recipes[index].servings.toString()}',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: widget.recipes[index].extendedIngredients!
                      .map(
                        (ingredient) => SizedBox(
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            color: Theme.of(context).secondaryHeaderColor,
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
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Image(
                                  fit: BoxFit.contain,
                                  image: NetworkImage(
                                    FoodAppConfig.instance!.values.imagesUrl! +
                                        ingredient.image!,
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
                                      '${ingredient.amount.toString()} ${ingredient.unit}',
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
                      )
                      .toList(),
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
                            widget.recipes[index].instructions!,
                          ),
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
    );
  }
}

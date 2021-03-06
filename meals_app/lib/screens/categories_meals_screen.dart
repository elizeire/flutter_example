import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, idx) {
            return MealItem(
                id: categoryMeals[idx].id,
                title: categoryMeals[idx].title,
                imageUrl: categoryMeals[idx].imageUrl,
                duration: categoryMeals[idx].duration,
                complexity: categoryMeals[idx].complexity,
                affordability: categoryMeals[idx].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}

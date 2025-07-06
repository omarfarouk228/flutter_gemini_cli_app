import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gemini_cli_app/providers/recipe_provider.dart';
import 'package:flutter_gemini_cli_app/recipe_card.dart';

void main() {
  // Wrap the app in a ProviderScope to make providers available to all widgets.
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

// Extend ConsumerWidget to listen to providers.
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the recipeListProvider to get the async state of the recipe list.
    final recipeListAsync = ref.watch(recipeListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Recipes'),
      ),
      // Handle the different states of the async value (loading, error, data).
      body: recipeListAsync.when(
        data: (recipes) {
          // If there are no recipes, show a message.
          if (recipes.isEmpty) {
            return const Center(
              child: Text('No recipes found. Try again later.'),
            );
          }
          // If data is available, display it in a ListView.
          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RecipeCard(
                  title: recipe.title,
                  cookingTime: recipe.durationMinutes,
                  imageUrl: recipe.imageUrl,
                ),
              );
            },
          );
        },
        // Show a loading indicator while fetching data.
        loading: () => const Center(child: CircularProgressIndicator()),
        // Show an error message if fetching fails.
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

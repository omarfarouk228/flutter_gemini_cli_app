import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gemini_cli_app/models/recipe.dart';
import 'package:flutter_gemini_cli_app/services/recipe_api_service.dart';

part 'recipe_provider.g.dart';

/// Provides the RecipeApiService instance.
@riverpod
RecipeApiService recipeApiService(RecipeApiServiceRef ref) {
  return RecipeApiService();
}

/// Fetches the list of recipes from the API.
///
/// This is an auto-disposing provider that will cache the result
/// and automatically refetch when the app is restarted.
@riverpod
Future<List<Recipe>> recipeList(RecipeListRef ref) {
  final apiService = ref.watch(recipeApiServiceProvider);
  return apiService.fetchRecipes();
}

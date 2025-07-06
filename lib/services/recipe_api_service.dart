import 'package:dio/dio.dart';
import 'package:flutter_gemini_cli_app/models/recipe.dart';

/// A service class for handling recipe-related API requests.
class RecipeApiService {
  final Dio _dio;

  /// Creates a new RecipeApiService.
  ///
  /// A [Dio] instance can be provided for testing purposes.
  RecipeApiService({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://recipe-api.ofaroukk.com/',
              connectTimeout: const Duration(seconds: 5),
              receiveTimeout: const Duration(seconds: 3),
            ),
          );

  /// Fetches a list of recipes from the API.
  ///
  /// Throws an exception if the request fails.
  Future<List<Recipe>> fetchRecipes() async {
    try {
      final response = await _dio.get('/recipes');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Recipe.fromJson(json)).toList();
      } else {
        // Handle non-200 status codes
        throw Exception('Failed to load recipes: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors (e.g., network issues)
      throw Exception('Failed to load recipes: $e');
    } catch (e) {
      // Handle other errors (e.g., parsing)
      throw Exception('An unknown error occurred: $e');
    }
  }
}

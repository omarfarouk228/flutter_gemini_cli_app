import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:flutter_gemini_cli_app/models/recipe.dart';
import 'package:flutter_gemini_cli_app/services/recipe_api_service.dart';

// Create a mock for the Dio client
class MockDio extends Mock implements Dio {}

void main() {
  group('RecipeApiService', () {
    late RecipeApiService apiService;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      apiService = RecipeApiService(dio: mockDio);
    });

    final recipeJson = [
      {
        'id': 're_123',
        'title': 'Pasta Carbonara',
        'duration_minutes': 25,
        'image_url': 'https://example.com/carbonara.jpg',
        'ingredients': ['pasta', 'guanciale', 'eggs', 'pecorino']
      }
    ];

    test('fetchRecipes returns a list of recipes on success', () async {
      // Arrange
      when(mockDio.get('/recipes')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/recipes'),
          data: recipeJson,
          statusCode: 200,
        ),
      );

      // Act
      final result = await apiService.fetchRecipes();

      // Assert
      expect(result, isA<List<Recipe>>());
      expect(result.length, 1);
      expect(result.first.title, 'Pasta Carbonara');
    });

    test('fetchRecipes throws an exception on failure', () async {
      // Arrange
      when(mockDio.get('/recipes')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: '/recipes'),
          statusCode: 404,
        ),
      );

      // Act & Assert
      expect(apiService.fetchRecipes(), throwsException);
    });
  });
}

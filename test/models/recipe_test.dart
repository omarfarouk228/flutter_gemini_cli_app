import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gemini_cli_app/models/recipe.dart';

void main() {
  group('Recipe', () {
    final json = {
      'id': 1,
      'title': 'Pasta Carbonara',
      'duration_minutes': 25,
      'image_url': 'https://example.com/carbonara.jpg',
      'ingredients': ['pasta', 'guanciale', 'eggs', 'pecorino'],
    };

    final recipe = Recipe(
      id: 1,
      title: 'Pasta Carbonara',
      durationMinutes: 25,
      imageUrl: 'https://example.com/carbonara.jpg',
      ingredients: ['pasta', 'guanciale', 'eggs', 'pecorino'],
    );

    test('fromJson creates a valid Recipe object', () {
      final result = Recipe.fromJson(json);
      expect(result.id, recipe.id);
      expect(result.title, recipe.title);
      expect(result.durationMinutes, recipe.durationMinutes);
      expect(result.imageUrl, recipe.imageUrl);
      expect(result.ingredients, recipe.ingredients);
    });

    test('toJson returns a valid JSON map', () {
      final result = recipe.toJson();
      expect(result, json);
    });
  });
}

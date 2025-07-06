import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gemini_cli_app/recipe_card.dart';

void main() {
  testWidgets('RecipeCard displays title and cooking time', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: RecipeCard(
          title: 'Test Recipe',
          cookingTime: 45,
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ),
    );

    // Act & Assert
    expect(find.text('Test Recipe'), findsOneWidget);
    expect(find.text('45 min'), findsOneWidget);
    expect(find.byIcon(Icons.timer_outlined), findsOneWidget);
  });
}

import 'package:flutter/material.dart';

/// A modern card widget to display a recipe's summary.
///
/// This widget is composed of smaller, private sub-widgets to improve
/// readability and maintainability.
class RecipeCard extends StatelessWidget {
  /// Creates a new RecipeCard.
  ///
  /// All parameters are required.
  const RecipeCard({
    super.key,
    required this.title,
    required this.cookingTime,
    required this.imageUrl,
  });

  /// The title of the recipe.
  final String title;

  /// The total cooking time in minutes.
  final int cookingTime;

  /// The URL for the recipe's image.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAlias, // Clips the child (Column) to the card's shape
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RecipeImage(imageUrl: imageUrl),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _RecipeTitle(title: title),
                const SizedBox(height: 8.0),
                _RecipeCookingTime(cookingTime: cookingTime),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Displays the recipe image with loading and error builders.
class _RecipeImage extends StatelessWidget {
  const _RecipeImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: 180,
      width: double.infinity,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          height: 180,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const SizedBox(
          height: 180,
          child: Icon(
            Icons.broken_image,
            size: 48,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}

/// Displays the recipe title with consistent styling.
class _RecipeTitle extends StatelessWidget {
  const _RecipeTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// Displays the cooking time with a timer icon.
class _RecipeCookingTime extends StatelessWidget {
  const _RecipeCookingTime({required this.cookingTime});

  final int cookingTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.timer_outlined,
          size: 20.0,
          color: Colors.grey,
        ),
        const SizedBox(width: 4.0),
        Text(
          '$cookingTime min',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}

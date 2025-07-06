# Flutter Project Development Charter

## General Instructions

- When generating new Dart/Flutter code, strictly follow the style conventions defined in "Effective Dart".
- Ensure that all new public functions, classes, and widgets have Docstring comments (`///`).
- Systematically prefer using `const` widgets and constructors whenever possible to optimize build and runtime performance.
- All generated code must be compatible with Dart 3+ and the latest stable version of Flutter. Null safety (`?`, `!`, `required`) must be used strictly and correctly.

## Coding Style and Flutter Conventions

- File names must use `snake_case` (e.g., `recipe_card.dart`).
- Class names, enums, and extensions must use `UpperCamelCase` (e.g., `RecipeCard`).
- Private class members, variables, and functions (visible only within the file) must be prefixed with an underscore `_` (e.g., `_privateVariable`, `_buildHeader()`).
- Avoid using the `as` operator for casting. Prefer type checks with `is` or `try-catch` blocks for better robustness.

## Specific Components and Architecture

- **State Management:** The preferred state management solution for this project is **Riverpod**. When generating providers, always use the new syntax with code generators (`@riverpod`).
- **Folder Structure:** The code is organized by feature (e.g., `lib/features/authentication/`). Each feature contains its own sub-folders (`data`, `domain`, `presentation`). New components should be placed in the corresponding feature folder.
- **Network Layer:** For API calls, use the `dio` package. Always include robust error handling (`try/catch` with custom exceptions) and configure an `Interceptor` for logging requests and responses in debug mode.

## Regarding Dependencies (`pubspec.yaml`)

- Avoid introducing new external dependencies unless absolutely necessary and no alternative exists in the Flutter SDK.
- If a new dependency is required, ensure it has a good score on pub.dev, is well-maintained, and is compatible with other project packages.

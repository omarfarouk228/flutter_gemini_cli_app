# Flutter Recipe App

A modern, clean, and scalable recipe application built with Flutter. This project demonstrates best practices in Flutter development, including state management with Riverpod, dependency injection, and a feature-driven project structure.

## ✨ Features

- **Modern UI**: Clean and user-friendly interface built with Material Design principles.
- **State Management**: Scalable state management using **Flutter Riverpod** for dependency injection and reactive state updates.
- **API Integration**: Fetches recipe data from a remote API using the **Dio** package.
- **Code Generation**: Uses **JsonSerializable** and **Riverpod Generator** to reduce boilerplate and ensure type safety.
- **Well-Tested**: Includes a suite of unit, widget, and integration tests to ensure code quality and reliability.
- **Refactored Widgets**: Follows best practices for widget composition, breaking down complex UI into smaller, manageable components.

## 📂 Project Structure

The project follows a feature-driven architecture to keep the codebase organized and scalable.

```
lib/
├── models/         # Data models (e.g., Recipe)
├── providers/      # Riverpod providers for state management
├── services/       # API services for data fetching
├── recipe_card.dart  # Reusable UI components
└── main.dart       # App entry point and main UI

.test/
├── app/            # Integration-style tests
├── models/         # Unit tests for data models
├── services/       # Unit tests for API services
└── widgets/        # Widget tests for UI components
```

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.x or higher)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)

### Installation

1.  **Clone the repository:**

    ```sh
    git clone https://github.com/your-username/flutter_recipe_app.git
    cd flutter_recipe_app
    ```

2.  **Install dependencies:**

    ```sh
    flutter pub get
    ```

3.  **Run the build runner:**
    This step is necessary to generate the code required by `json_serializable` and `riverpod_generator`.

    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the application:**
    ```sh
    flutter run
    ```

## ✅ Running Tests

To run the full suite of unit and widget tests, use the following command:

```sh
flutter test
```

## 🛠️ Built With

- [Flutter](https://flutter.dev/) - The UI toolkit for building beautiful, natively compiled applications.
- [Dart](https://dart.dev/) - The programming language used by Flutter.
- [Riverpod](https://riverpod.dev/) - A reactive state management and dependency injection framework.
- [Dio](https://pub.dev/packages/dio) - A powerful HTTP client for Dart.
- [JsonSerializable](https://pub.dev/packages/json_serializable) - For automated JSON serialization.
- [Mockito](https://pub.dev/packages/mockito) - For creating mock objects in tests.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/your-username/flutter_recipe_app/issues).

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeApiServiceHash() => r'809adfa6c720c141a03bcac260ede38f5cacaa07';

/// Provides the RecipeApiService instance.
///
/// Copied from [recipeApiService].
@ProviderFor(recipeApiService)
final recipeApiServiceProvider = AutoDisposeProvider<RecipeApiService>.internal(
  recipeApiService,
  name: r'recipeApiServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recipeApiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecipeApiServiceRef = AutoDisposeProviderRef<RecipeApiService>;
String _$recipeListHash() => r'72597477e255ea5cee3c374ae9e4af1922df3201';

/// Fetches the list of recipes from the API.
///
/// This is an auto-disposing provider that will cache the result
/// and automatically refetch when the app is restarted.
///
/// Copied from [recipeList].
@ProviderFor(recipeList)
final recipeListProvider = AutoDisposeFutureProvider<List<Recipe>>.internal(
  recipeList,
  name: r'recipeListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recipeListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecipeListRef = AutoDisposeFutureProviderRef<List<Recipe>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

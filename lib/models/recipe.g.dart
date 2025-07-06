// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  durationMinutes: (json['duration_minutes'] as num).toInt(),
  imageUrl: json['image_url'] as String,
  ingredients: (json['ingredients'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'duration_minutes': instance.durationMinutes,
  'image_url': instance.imageUrl,
  'ingredients': instance.ingredients,
};

// This file is "main.dart"
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'movie.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'movie.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Movie with _$Movie {
  const factory Movie({
    required String id,
    required String title,
    required String des,
    required int length,     ///in minutes
    required int ageRating,
    required String category,
    required String imgUrl,
    required DateTime releaseDate,
    required String videoUrl,
    required bool isSeason,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json)
  => _$MovieFromJson(json);
}
// This file is "main.dart"
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:netflix_clone/models/profile.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'app_user.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'app_user.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required List<Profile> profiles,
    required String email

  }) = _AppUser;

  factory AppUser.fromJson(Map<String, Object?> json)
  => _$AppUserFromJson(json);
}
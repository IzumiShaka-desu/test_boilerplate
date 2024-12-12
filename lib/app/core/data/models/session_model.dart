import 'package:hive_flutter/hive_flutter.dart';

part 'session_model.g.dart';

class SessionWrapper {
  final SavedSession session;
  final String message;
  SessionWrapper({
    required this.session,
    required this.message,
  });
}

@HiveType(typeId: 1)
class SavedSession {
  @HiveField(0)
  final String accessToken;
  @HiveField(1)
  final String tokenType;
  @HiveField(2)
  final int expiresIn;
  @HiveField(3)
  final int expiresAt;
  @HiveField(4)
  final String refreshToken;

  SavedSession({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.expiresAt,
    required this.refreshToken,
  });

  SavedSession copyWith({
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    int? expiresAt,
    String? refreshToken,
  }) =>
      SavedSession(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        expiresAt: expiresAt ?? this.expiresAt,
        refreshToken: refreshToken ?? this.refreshToken,
      );
}

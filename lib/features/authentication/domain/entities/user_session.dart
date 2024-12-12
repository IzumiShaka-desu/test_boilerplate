import 'package:equatable/equatable.dart';

class UserSession extends Equatable {
  final String tokenType;
  final String refreshToken;
  final String accessToken;
  final int expiresIn;
  final int expiresAt;

  const UserSession({
    required this.tokenType,
    required this.refreshToken,
    required this.accessToken,
    required this.expiresIn,
    required this.expiresAt,
  });

  UserSession copyWith({
    String? tokenType,
    String? refreshToken,
    String? accessToken,
    int? expiresIn,
    int? expiresAt,
  }) =>
      UserSession(
        tokenType: tokenType ?? this.tokenType,
        refreshToken: refreshToken ?? this.refreshToken,
        accessToken: accessToken ?? this.accessToken,
        expiresIn: expiresIn ?? this.expiresIn,
        expiresAt: expiresAt ?? this.expiresAt,
      );

  @override
  List<Object?> get props => [
        tokenType,
        refreshToken,
        accessToken,
        expiresIn,
        expiresAt,
      ];
}

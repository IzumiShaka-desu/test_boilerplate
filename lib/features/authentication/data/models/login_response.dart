// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import '../../../../app/core/data/models/session_model.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final int statusCode;
  final String timestamp;
  final bool success;
  final String message;
  final DataClass data;
  final String? error;

  LoginResponse({
    required this.statusCode,
    required this.timestamp,
    required this.success,
    required this.message,
    required this.data,
    required this.error,
  });
  SessionWrapper get session => SessionWrapper(
        session: SavedSession(
          accessToken: data.session.accessToken,
          tokenType: data.session.tokenType,
          expiresIn: data.session.expiresIn,
          expiresAt: data.session.expiresAt,
          refreshToken: data.session.refreshToken,
        ),
        message: message,
      );
  LoginResponse copyWith({
    int? statusCode,
    String? timestamp,
    bool? success,
    String? message,
    DataClass? data,
    dynamic error,
  }) =>
      LoginResponse(
        statusCode: statusCode ?? this.statusCode,
        timestamp: timestamp ?? this.timestamp,
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
        error: error ?? this.error,
      );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        statusCode: json["status_code"],
        timestamp: json["timestamp"],
        success: json["success"],
        message: json["message"],
        data: DataClass.fromJson(json["data"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "timestamp": timestamp,
        "success": success,
        "message": message,
        "data": data.toJson(),
        "error": error,
      };
}

class DataClass {
  // final User user;
  final Session session;
  // final Profile profile;

  DataClass({
    // required this.user,
    required this.session,
    // required this.profile,
  });

  DataClass copyWith({
    // User? user,
    Session? session,
    // Profile? profile,
  }) =>
      DataClass(
        // user: user ?? this.user,
        session: session ?? this.session,
        // profile: profile ?? this.profile,
      );

  factory DataClass.fromJson(Map<String, dynamic> json) => DataClass(
        // user: User.fromJson(json["user"]),
        session: Session.fromJson(json["session"]),
        // profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        // "user": user.toJson(),
        "session": session.toJson(),
        // "profile": profile.toJson(),
      };
}

// class Profile {
//   final String id;
//   final String name;
//   final String email;
//   final dynamic employeeNumber;
//   final String status;
//   final Role role;

//   Profile({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.employeeNumber,
//     required this.status,
//     required this.role,
//   });

//   Profile copyWith({
//     String? id,
//     String? name,
//     String? email,
//     dynamic employeeNumber,
//     String? status,
//     Role? role,
//   }) =>
//       Profile(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         email: email ?? this.email,
//         employeeNumber: employeeNumber ?? this.employeeNumber,
//         status: status ?? this.status,
//         role: role ?? this.role,
//       );

//   factory Profile.fromJson(Map<String, dynamic> json) => Profile(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         employeeNumber: json["employee_number"],
//         status: json["status"],
//         role: Role.fromJson(json["role"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "employee_number": employeeNumber,
//         "status": status,
//         "role": role.toJson(),
//       };
// }

// class Role {
//   final String title;
//   final String slug;
//   final List<RolePermission> rolePermission;

//   Role({
//     required this.title,
//     required this.slug,
//     required this.rolePermission,
//   });

//   Role copyWith({
//     String? title,
//     String? slug,
//     List<RolePermission>? rolePermission,
//   }) =>
//       Role(
//         title: title ?? this.title,
//         slug: slug ?? this.slug,
//         rolePermission: rolePermission ?? this.rolePermission,
//       );

//   factory Role.fromJson(Map<String, dynamic> json) => Role(
//         title: json["title"],
//         slug: json["slug"],
//         rolePermission: List<RolePermission>.from(
//             json["role_permission"].map((x) => RolePermission.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "slug": slug,
//         "role_permission":
//             List<dynamic>.from(rolePermission.map((x) => x.toJson())),
//       };
// }

// class RolePermission {
//   final String resource;
//   final List<String> action;

//   RolePermission({
//     required this.resource,
//     required this.action,
//   });

//   RolePermission copyWith({
//     String? resource,
//     List<String>? action,
//   }) =>
//       RolePermission(
//         resource: resource ?? this.resource,
//         action: action ?? this.action,
//       );

//   factory RolePermission.fromJson(Map<String, dynamic> json) => RolePermission(
//         resource: json["resource"],
//         action: List<String>.from(json["action"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "resource": resource,
//         "action": List<dynamic>.from(action.map((x) => x)),
//       };
// }

class Session {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final int expiresAt;
  final String refreshToken;
  // final User user;

  Session({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.expiresAt,
    required this.refreshToken,
    // required this.user,
  });

  Session copyWith({
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    int? expiresAt,
    String? refreshToken,
    // User? user,
  }) =>
      Session(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        expiresAt: expiresAt ?? this.expiresAt,
        refreshToken: refreshToken ?? this.refreshToken,
        // user: user ?? this.user,
      );

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        expiresAt: json["expires_at"],
        refreshToken: json["refresh_token"],
        // user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "expires_at": expiresAt,
        "refresh_token": refreshToken,
        // "user": user.toJson(),
      };
}

// class User {
//   final String id;
//   final String aud;
//   final String role;
//   final String email;
//   final DateTime emailConfirmedAt;
//   final String phone;
//   final DateTime confirmationSentAt;
//   final DateTime confirmedAt;
//   final DateTime recoverySentAt;
//   final DateTime lastSignInAt;
//   final AppMetadata appMetadata;
//   final UserMetadataClass userMetadata;
//   final List<Identity> identities;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final bool isAnonymous;

//   User({
//     required this.id,
//     required this.aud,
//     required this.role,
//     required this.email,
//     required this.emailConfirmedAt,
//     required this.phone,
//     required this.confirmationSentAt,
//     required this.confirmedAt,
//     required this.recoverySentAt,
//     required this.lastSignInAt,
//     required this.appMetadata,
//     required this.userMetadata,
//     required this.identities,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.isAnonymous,
//   });

//   User copyWith({
//     String? id,
//     String? aud,
//     String? role,
//     String? email,
//     DateTime? emailConfirmedAt,
//     String? phone,
//     DateTime? confirmationSentAt,
//     DateTime? confirmedAt,
//     DateTime? recoverySentAt,
//     DateTime? lastSignInAt,
//     AppMetadata? appMetadata,
//     UserMetadataClass? userMetadata,
//     List<Identity>? identities,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     bool? isAnonymous,
//   }) =>
//       User(
//         id: id ?? this.id,
//         aud: aud ?? this.aud,
//         role: role ?? this.role,
//         email: email ?? this.email,
//         emailConfirmedAt: emailConfirmedAt ?? this.emailConfirmedAt,
//         phone: phone ?? this.phone,
//         confirmationSentAt: confirmationSentAt ?? this.confirmationSentAt,
//         confirmedAt: confirmedAt ?? this.confirmedAt,
//         recoverySentAt: recoverySentAt ?? this.recoverySentAt,
//         lastSignInAt: lastSignInAt ?? this.lastSignInAt,
//         appMetadata: appMetadata ?? this.appMetadata,
//         userMetadata: userMetadata ?? this.userMetadata,
//         identities: identities ?? this.identities,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         isAnonymous: isAnonymous ?? this.isAnonymous,
//       );

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         aud: json["aud"],
//         role: json["role"],
//         email: json["email"],
//         emailConfirmedAt: DateTime.parse(json["email_confirmed_at"]),
//         phone: json["phone"],
//         confirmationSentAt: DateTime.parse(json["confirmation_sent_at"]),
//         confirmedAt: DateTime.parse(json["confirmed_at"]),
//         recoverySentAt: DateTime.parse(json["recovery_sent_at"]),
//         lastSignInAt: DateTime.parse(json["last_sign_in_at"]),
//         appMetadata: AppMetadata.fromJson(json["app_metadata"]),
//         userMetadata: UserMetadataClass.fromJson(json["user_metadata"]),
//         identities: List<Identity>.from(
//             json["identities"].map((x) => Identity.fromJson(x))),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         isAnonymous: json["is_anonymous"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "aud": aud,
//         "role": role,
//         "email": email,
//         "email_confirmed_at": emailConfirmedAt.toIso8601String(),
//         "phone": phone,
//         "confirmation_sent_at": confirmationSentAt.toIso8601String(),
//         "confirmed_at": confirmedAt.toIso8601String(),
//         "recovery_sent_at": recoverySentAt.toIso8601String(),
//         "last_sign_in_at": lastSignInAt.toIso8601String(),
//         "app_metadata": appMetadata.toJson(),
//         "user_metadata": userMetadata.toJson(),
//         "identities": List<dynamic>.from(identities.map((x) => x.toJson())),
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "is_anonymous": isAnonymous,
//       };
// }

// class AppMetadata {
//   final String provider;
//   final List<String> providers;

//   AppMetadata({
//     required this.provider,
//     required this.providers,
//   });

//   AppMetadata copyWith({
//     String? provider,
//     List<String>? providers,
//   }) =>
//       AppMetadata(
//         provider: provider ?? this.provider,
//         providers: providers ?? this.providers,
//       );

//   factory AppMetadata.fromJson(Map<String, dynamic> json) => AppMetadata(
//         provider: json["provider"],
//         providers: List<String>.from(json["providers"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "provider": provider,
//         "providers": List<dynamic>.from(providers.map((x) => x)),
//       };
// }

// class Identity {
//   final String? identityId;
//   final String? id;
//   final String? userId;
//   final UserMetadataClass? identityData;
//   final String? provider;
//   final DateTime? lastSignInAt;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String? email;

//   Identity({
//     required this.identityId,
//     required this.id,
//     required this.userId,
//     required this.identityData,
//     required this.provider,
//     required this.lastSignInAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.email,
//   });

//   Identity copyWith({
//     String? identityId,
//     String? id,
//     String? userId,
//     UserMetadataClass? identityData,
//     String? provider,
//     DateTime? lastSignInAt,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     String? email,
//   }) =>
//       Identity(
//         identityId: identityId ?? this.identityId,
//         id: id ?? this.id,
//         userId: userId ?? this.userId,
//         identityData: identityData ?? this.identityData,
//         provider: provider ?? this.provider,
//         lastSignInAt: lastSignInAt ?? this.lastSignInAt,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         email: email ?? this.email,
//       );

//   factory Identity.fromJson(Map<String, dynamic> json) => Identity(
//         identityId: json["identity_id"],
//         id: json["id"],
//         userId: json["user_id"],
//         identityData: UserMetadataClass.fromJson(json["identity_data"]),
//         provider: json["provider"],
//         lastSignInAt: DateTime.parse(json["last_sign_in_at"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         email: json["email"],
//       );

//   Map<String, dynamic> toJson() => {
//         "identity_id": identityId,
//         "id": id,
//         "user_id": userId,
//         "identity_data": identityData.toJson(),
//         "provider": provider,
//         "last_sign_in_at": lastSignInAt.toIso8601String(),
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "email": email,
//       };
// }

// class UserMetadataClass {
//   final String? email;
//   final bool? emailVerified;
//   final String? name;
//   final bool? phoneVerified;
//   final String? role;
//   final String? sub;

//   UserMetadataClass({
//     required this.email,
//     required this.emailVerified,
//     required this.name,
//     required this.phoneVerified,
//     required this.role,
//     required this.sub,
//   });

//   UserMetadataClass copyWith({
//     String? email,
//     bool? emailVerified,
//     String? name,
//     bool? phoneVerified,
//     String? role,
//     String? sub,
//   }) =>
//       UserMetadataClass(
//         email: email ?? this.email,
//         emailVerified: emailVerified ?? this.emailVerified,
//         name: name ?? this.name,
//         phoneVerified: phoneVerified ?? this.phoneVerified,
//         role: role ?? this.role,
//         sub: sub ?? this.sub,
//       );

//   factory UserMetadataClass.fromJson(Map<String, dynamic> json) =>
//       UserMetadataClass(
//         email: json["email"],
//         emailVerified: json["email_verified"],
//         name: json["name"],
//         phoneVerified: json["phone_verified"],
//         role: json["role"],
//         sub: json["sub"],
//       );

//   Map<String, dynamic> toJson() => {
//         "email": email,
//         "email_verified": emailVerified,
//         "name": name,
//         "phone_verified": phoneVerified,
//         "role": role,
//         "sub": sub,
//       };
// }

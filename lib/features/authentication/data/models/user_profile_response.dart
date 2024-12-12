// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

import 'package:test_boilerplate/features/authentication/domain/entities/user_profile.dart';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final String id;
  final String name;
  final String email;
  final RoleModel role;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  ProfileModel copyWith({
    String? id,
    String? name,
    String? email,
    RoleModel? role,
  }) =>
      ProfileModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        role: role ?? this.role,
      );
  UserProfile toEntity() => UserProfile(id: id, name: name, email: email, role: role.toEntity());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: RoleModel.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role.toJson(),
      };
}

class RoleModel {
  final String title;
  final String slug;
  final List<RoleModelPermission> rolePermission;

  RoleModel({
    required this.title,
    required this.slug,
    required this.rolePermission,
  });

  RoleModel copyWith({
    String? title,
    String? slug,
    List<RoleModelPermission>? rolePermission,
  }) =>
      RoleModel(
        title: title ?? this.title,
        slug: slug ?? this.slug,
        rolePermission: rolePermission ?? this.rolePermission,
      );

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        title: json["title"],
        slug: json["slug"],
        rolePermission:
            List<RoleModelPermission>.from(json["role_permission"].map((x) => RoleModelPermission.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "role_permission": List<dynamic>.from(rolePermission.map((x) => x.toJson())),
      };

  Role toEntity() {
    return Role(title: title, slug: slug, rolePermission: rolePermission.map((e) => e.toEntity()).toList());
  }
}

class RoleModelPermission {
  final String resource;
  final List<String> action;

  RoleModelPermission({
    required this.resource,
    required this.action,
  });

  RoleModelPermission copyWith({
    String? resource,
    List<String>? action,
  }) =>
      RoleModelPermission(
        resource: resource ?? this.resource,
        action: action ?? this.action,
      );

  factory RoleModelPermission.fromJson(Map<String, dynamic> json) => RoleModelPermission(
        resource: json["resource"],
        action: List<String>.from(json["action"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "resource": resource,
        "action": List<dynamic>.from(
          action.map((x) => x),
        ),
      };

  RolePermission toEntity() {
    return RolePermission(
      resource: resource,
      action: action,
    );
  }
}

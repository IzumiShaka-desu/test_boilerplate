import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String id;
  final String name;
  final String email;
  final Role role;

  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  // copyWith
  UserProfile copyWith({
    String? id,
    String? name,
    String? email,
    Role? role,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [id, name, email, role];
}

class Role extends Equatable {
  final String title;
  final String slug;
  final List<RolePermission> rolePermission;

  const Role({
    required this.title,
    required this.slug,
    required this.rolePermission,
  });

  Role copyWith({
    String? title,
    String? slug,
    List<RolePermission>? rolePermission,
  }) =>
      Role(
        title: title ?? this.title,
        slug: slug ?? this.slug,
        rolePermission: rolePermission ?? this.rolePermission,
      );

  @override
  List<Object?> get props => [
        title,
        slug,
        rolePermission,
      ];
}

class RolePermission extends Equatable {
  final String resource;
  final List<String> action;

  const RolePermission({
    required this.resource,
    required this.action,
  });

  RolePermission copyWith({
    String? resource,
    List<String>? action,
  }) =>
      RolePermission(
        resource: resource ?? this.resource,
        action: action ?? this.action,
      );

  @override
  List<Object?> get props => [
        resource,
        action,
      ];
}

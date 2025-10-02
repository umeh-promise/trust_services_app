import 'package:flutter/material.dart';
import 'package:trust_services_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
    super.role,
    super.services,
    super.phone,
    super.dob,
    super.city,
    super.address,
    super.customService,
    super.state,
    super.shortBio,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'email': email, 'name': name};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
    );
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    ValueGetter<String?>? role,
    ValueGetter<List<String>?>? services,
    ValueGetter<String?>? phone,
    ValueGetter<String?>? dob,
    ValueGetter<String?>? city,
    ValueGetter<String?>? address,
    ValueGetter<String?>? customService,
    ValueGetter<String?>? state,
    ValueGetter<String?>? shortBio,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role != null ? role() : this.role,
      services: services != null ? services() : this.services,
      phone: phone != null ? phone() : this.phone,
      dob: dob != null ? dob() : this.dob,
      city: city != null ? city() : this.city,
      address: address != null ? address() : this.address,
      customService: customService != null
          ? customService()
          : this.customService,
      state: state != null ? state() : this.state,
      shortBio: shortBio != null ? shortBio() : this.shortBio,
    );
  }
}

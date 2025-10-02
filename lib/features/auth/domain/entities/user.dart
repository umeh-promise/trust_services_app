enum Role { client, serviceProvider }

class User {
  final String id;
  final String name;
  final String email;
  final String? role;
  final List<String>? services;
  final String? phone;
  final String? dob;
  final String? city;
  final String? address;
  final String? customService;
  final String? state;
  final String? shortBio;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.role,
    this.services,
    this.phone,
    this.dob,
    this.city,
    this.address,
    this.shortBio,
    this.customService,
    this.state,
  });
}

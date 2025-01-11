class User {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String image;

  User({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      gender: json['gender'],
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
      'image': image,
    };
  }
}

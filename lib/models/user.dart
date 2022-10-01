class User {
  final String id;
  final String email;

  User({
    required this.id,
    required this.email
  });

  factory User.fromMap(Map<String, Object> map) {
    return User(
      id: map['uid'] as String,
      email: map['email'] as String
    );
  }

  Map<String, String> toMap() {
    return {
      'uid': id,
      'email': email
    };
  }
}
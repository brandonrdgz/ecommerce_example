class User {
  final String uid;
  final String email;

  User({
    required this.uid,
    required this.email
  });

  factory User.fromMap(Map<String, Object> map) {
    return User(
      uid: map['uid'] as String,
      email: map['email'] as String
    );
  }

  Map<String, String> toMap() {
    return {
      'uid': uid,
      'email': email
    };
  }
}
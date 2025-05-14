class UserModel {
  String uid;
  String name;
  String surname;
  String organization;
  String email;
  String role;

  UserModel({
    required this.uid,
    required this.name,
    required this.surname,
    required this.organization,
    required this.email,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      organization: json['organization'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'surname': surname,
      'organization': organization,
      'email': email,
      'role': role,
    };
  }
}

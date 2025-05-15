class Organization {
  String uid;
  String name;

  Organization({required this.uid, required this.name});

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      uid: json['uid'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
    };
  }
}
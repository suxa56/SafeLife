class Position {
  String uid;
  String name;
  List<String> jobDescription;

  Position({
    required this.uid,
    required this.name,
    required this.jobDescription,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      uid: json['uid'] as String,
      name: json['name'] as String,
      jobDescription: List<String>.from(json['jobDescription'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'jobDescription': jobDescription,
    };
  }
}
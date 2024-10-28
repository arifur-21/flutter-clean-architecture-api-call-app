class PutUserModel {
  final String name;
  final String job;

  PutUserModel({required this.name, required this.job});

  factory PutUserModel.fromJson(Map<String, dynamic> json) {
    return PutUserModel(
      name: json['name']?? '',
      job: json['job'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'job': job,
    };
  }
}
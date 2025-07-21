class UserModel {
  final String firstName;
  final String lastName;
  final String gender;
  final String? image;
  final int completeCount;
  final int unCompleteCount;

  UserModel({
    this.image,
    required this.firstName,
    required this.lastName,
    required this.gender,
    this.completeCount = 0,
    this.unCompleteCount = 0,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    int? completeCount,
    int? unCompleteCount,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      completeCount: completeCount ?? this.completeCount,
      unCompleteCount: unCompleteCount ?? this.unCompleteCount,
    );
  }

  Map<String, String> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image ?? '',
      'completeCount': completeCount.toString(),
      'unCompleteCount': unCompleteCount.toString(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      gender: map['gender'] ?? '',
      image: map['image'] == '' ? null : map['image'],
      completeCount: int.tryParse(map['completeCount'] ?? '0') ?? 0,
      unCompleteCount:
          int.tryParse(map['unCompleteCount'] ?? '0') ?? 0,
    );
  }
}

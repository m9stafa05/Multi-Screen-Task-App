class UserModel {
  final String firstName;
  final String lastName;
  final String gender;
  final String? image;


  UserModel({
    this.image,
    required this.firstName,
    required this.lastName,
    required this.gender,
  });


  Map<String, String> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image ?? '',
    };
  }


  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      gender: map['gender'] ?? '',
      image: map['image'] == '' ? null : map['image'],
    );
  }
}

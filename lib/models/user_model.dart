// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// var emptyUserModel = UserModel();
var emptyUserModel = UserModel();

class UserModel {
  String? profileImage;
  String? firstName;
  String? lastName;
  String? userEmail;
  String? userGender;
  String? uID;
  UserModel({
    this.profileImage,
    this.firstName,
    this.lastName,
    this.userEmail,
    this.userGender,
    this.uID,
  });

  UserModel copyWith({
    String? profileImage,
    String? firstName,
    String? lastName,
    String? userEmail,
    String? userGender,
    String? uID,
  }) {
    return UserModel(
      profileImage: profileImage ?? this.profileImage,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userEmail: userEmail ?? this.userEmail,
      userGender: userGender ?? this.userGender,
      uID: uID ?? this.uID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'profileImage': profileImage,
      'firstName': firstName,
      'lastName': lastName,
      'userEmail': userEmail,
      'userGender': userGender,
      'uID': uID,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      profileImage:
          map['profileImage'] != null ? map['profileImage'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      userEmail: map['userEmail'] != null ? map['userEmail'] as String : null,
      userGender:
          map['userGender'] != null ? map['userGender'] as String : null,
      uID: map['uID'] != null ? map['uID'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(profileImage: $profileImage, firstName: $firstName, lastName: $lastName, userEmail: $userEmail, userGender: $userGender, uID: $uID)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.profileImage == profileImage &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.userEmail == userEmail &&
        other.userGender == userGender &&
        other.uID == uID;
  }

  @override
  int get hashCode {
    return profileImage.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        userEmail.hashCode ^
        userGender.hashCode ^
        uID.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : 0,
      email: map['email'] != null ? map['email'] as String : '',
      firstName: map['first_name'] != null ? map['first_name'] as String : '',
      lastName: map['last_name'] != null ? map['last_name'] as String : '',
      avatar: map['avatar'] != null ? map['avatar'] as String : '',
    );
  }
}

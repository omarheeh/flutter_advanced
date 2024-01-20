import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_respons.g.dart';

@JsonSerializable()
class LoginRespons {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;

  LoginRespons({this.message, this.userData, this.status, this.code});

  factory LoginRespons.fromJson(Map<String, dynamic> json) =>
      _$LoginResponsFromJson(json);
}

@JsonSerializable()
class UserData {
  final String token;
  @JsonKey(name: 'username')
  final String userName;

  UserData({
    required this.token,
    required this.userName,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

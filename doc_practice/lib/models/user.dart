import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

//final int registration;
class User{

  String name;
  String email;

  User(this.name, this.email);

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);

  Map<String,dynamic> toJson() => _$UserToJson(this);
}
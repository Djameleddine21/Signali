import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

class User {
  String firstName;
  String lastName;
  String phoneNumber;
  String numSecSoc;


  ///default Constructor
  User({
    @required this.firstName,
    @required this.lastName,
    @required this.numSecSoc,
    @required this.phoneNumber,
  })  : assert(firstName != null),
        assert(lastName != null),
        assert(phoneNumber != null),
        assert(numSecSoc != null);

  ///create user instance form json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  
  ///create a json form user instance
  Map<String, dynamic> toJson() => _$UserToJson(this);

}

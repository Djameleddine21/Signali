import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

class User {
  String nom;
  String prenom;
  String numTel;
  String numSecSoc;
  bool isAdmin;

  ///default Constructor
  User({
    @required this.nom,
    @required this.prenom,
    @required this.numSecSoc,
    @required this.numTel,
    @required this.isAdmin
  })  : assert(nom != null),
        assert(prenom != null),
        assert(numTel != null),
        assert(numSecSoc != null);

  ///create user instance form json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  
  ///create a json form user instance
  Map<String, dynamic> toJson() => _$UserToJson(this);

}

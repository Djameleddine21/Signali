// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    nom: json['nom'] as String,
    prenom: json['prenom'] as String,
    numSecSoc: json['numSecSoc'] as String,
    numTel: json['numTel'] as String,
    isAdmin: json['isAdmin'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nom': instance.nom,
      'prenom': instance.prenom,
      'numTel': instance.numTel,
      'numSecSoc': instance.numSecSoc,
      'isAdmin': instance.isAdmin,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyItemModel _$DummyItemModelFromJson(Map<String, dynamic> json) =>
    DummyItemModel(
      json['idTeam'] as String?,
      json['strLeague'] as String?,
      json['strTeamAlternate'] as String?,
      json['strDescriptionEN'] as String?,
      json['strBadge'] as String?,
      json['strTeam'] as String?,
    );

Map<String, dynamic> _$DummyItemModelToJson(DummyItemModel instance) =>
    <String, dynamic>{
      'idIeam': instance.idTeam,
      'strLeague': instance.strLeague,
      'strTeamAlternate': instance.strTeamAlternate,
      'strDescriptionEN': instance.strDescriptionEN,
      'strBadge': instance.strBadge,
      'strTeam': instance.strTeam,
    };

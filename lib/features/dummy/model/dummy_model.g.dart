// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyModel _$DummyModelFromJson(Map<String, dynamic> json) => DummyModel(
      (json['teams'] as List<dynamic>?)
          ?.map((e) => DummyItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DummyModelToJson(DummyModel instance) =>
    <String, dynamic>{
      'teams': instance.teams,
    };

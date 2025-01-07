import 'package:based_project_list_club_sepak_bola/features/dummy-item/model/dummy_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dummy_model.g.dart';

@JsonSerializable()
class  DummyModel {
  final List<DummyItemModel>? meals;

  DummyModel(this.meals);

  factory DummyModel.fromJson(Map<String, dynamic> json) => 
    _$DummyModelFromJson(json);

  Map<String, dynamic> toJson() => _$DummyModelToJson(this);  
}
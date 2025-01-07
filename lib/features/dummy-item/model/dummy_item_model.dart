import 'package:json_annotation/json_annotation.dart';

part 'dummy_item_model.g.dart';

@JsonSerializable()
class DummyItemModel {
  final String? idTeam;
  final String? strLeague;
  final String? strTeamAlternate;
  final String? strDescriptionEN;
  final String? strBadge;
  final String? strTeam;

  DummyItemModel(this.idTeam, this.strLeague, this.strTeamAlternate,
      this.strDescriptionEN, this.strBadge, this.strTeam);

  factory DummyItemModel.fromJson(Map<String, dynamic> json) =>
      _$DummyItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$DummyItemModelToJson(this);
}

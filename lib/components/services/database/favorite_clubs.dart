import 'package:drift/drift.dart';

class FavoriteClubs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get idTeam => text()();
  TextColumn get strLeague => text()();
  TextColumn get strTeamAlternate => text()();
  TextColumn get strDescriptionEN => text()();
  TextColumn get strBadge => text()();
  TextColumn get strTeam => text()();
  TextColumn get strStadium => text()();
  DateTimeColumn get createdAt => dateTime().nullable()();
}
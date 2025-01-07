import 'package:based_project_list_club_sepak_bola/features/dummy/model/dummy_model.dart';

abstract class DummyState {}

class DummyStateSuccess extends DummyState {
  final DummyModel listDummy;
  DummyStateSuccess(this.listDummy);
}

class DummyStateLoading extends DummyState {}

class DummyStateIdle extends DummyState {}

class DummyStateError extends DummyState {}
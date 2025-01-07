import 'package:based_project_list_club_sepak_bola/features/dummy/model/dummy_model.dart';

abstract class DummyItemState {}

class DummyItemStateSuccess extends DummyItemState {
  final DummyModel? dummyItemModel;
  DummyItemStateSuccess(this.dummyItemModel);
}

class DummyItemStateLoading extends DummyItemState {}

class DummyItemStateIdle extends DummyItemState {}

class DummyItemStateError extends DummyItemState {}

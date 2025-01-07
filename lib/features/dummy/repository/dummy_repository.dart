import 'dart:convert';
import 'package:based_project_list_club_sepak_bola/components/base/base_repository.dart';
import 'package:based_project_list_club_sepak_bola/components/util/state.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy/model/dummy_model.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy/repository/dummy_datasource.dart';
import 'package:logger/logger.dart';

class DummyRepository extends BaseRepository {
  final DummyDatasource _datasource;
  DummyRepository(this._datasource);
  final _logger = Logger();

  void loadDummy({required ResponseHandler<DummyModel> response}) async {
    try {
      final String apiResponse = await _datasource.apiDummy();

      final Map<String, dynamic> json = jsonDecode(apiResponse);

      final DummyModel dummyData = DummyModel.fromJson(json);

      _logger.i(apiResponse);
      response.onSuccess(dummyData);
      response.onDone.call();
    } catch (e) {
      _logger.e(e);
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
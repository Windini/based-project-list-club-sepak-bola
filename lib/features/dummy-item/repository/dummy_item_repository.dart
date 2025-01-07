import 'dart:convert';

import 'package:based_project_list_club_sepak_bola/components/base/base_repository.dart';
import 'package:based_project_list_club_sepak_bola/components/util/state.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/repository/dummy_item_datasource.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy/model/dummy_model.dart';
import 'package:logger/logger.dart';

class DummyItemRepository extends BaseRepository {
  final _logger = Logger();
  final DummyItemDatasource _datasource;
  DummyItemRepository(this._datasource);

  void loadDummyItem(
      {required ResponseHandler<DummyModel> response, String? id}) async {
    try {
      final String apiResponse = await _datasource.apiDummyItem(id);

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
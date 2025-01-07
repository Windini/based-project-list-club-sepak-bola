import 'package:based_project_list_club_sepak_bola/components/base/base_dio_data_source.dart';
import 'package:based_project_list_club_sepak_bola/components/ext/dio_ext.dart';

class DummyDatasource extends BaseDioDataSource {
  DummyDatasource(super._client);

  Future<String> apiDummy() async {
    String path = 'search_all_teams.php';
    Map<String, dynamic> queryParameters = {'l': 'English Premier League'};

    return get<String>(path, queryParameters: queryParameters).load();
  }
}
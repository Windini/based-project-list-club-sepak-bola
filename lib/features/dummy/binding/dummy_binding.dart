import 'package:based_project_list_club_sepak_bola/components/util/network.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy/presentation/dummy_controller.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy/repository/dummy_datasource.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy/repository/dummy_repository.dart';
import 'package:get/get.dart';

class DummyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DummyDatasource(Network.dioClient()));
    Get.lazyPut(() => DummyRepository(Get.find()));
    Get.lazyPut(() => DummyController(Get.find()));
  }
}
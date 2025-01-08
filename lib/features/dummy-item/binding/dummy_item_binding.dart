import 'package:based_project_list_club_sepak_bola/components/util/network.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/presentation/dummy_item_controller.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/repository/dummy_item_datasource.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/repository/dummy_item_repository.dart';
import 'package:get/get.dart';

class DummyItemBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DummyItemDatasource(Network.dioClient()));
    Get.lazyPut(() => DummyItemRepository(Get.find()));
    Get.lazyPut(() => DummyItemController());
  }
}
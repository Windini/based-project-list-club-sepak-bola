import 'package:based_project_list_club_sepak_bola/components/config/app_const.dart';
import 'package:based_project_list_club_sepak_bola/components/config/app_route.dart';
import 'package:based_project_list_club_sepak_bola/components/config/app_style.dart';
import 'package:based_project_list_club_sepak_bola/components/services/app_service.dart';
import 'package:based_project_list_club_sepak_bola/components/util/storage_util.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/presentation/dummy_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _dependencyInjection();
  runApp(const MyApp());
}

/// ====== DI Section =====
/// Add dependency here when you need to use/available for all feature
/// ====== end =======
Future _dependencyInjection() async {
  final storage = StorageUtil(SecureStorage());
  Get.lazyPut(() => storage, fenix: true);
  Get.put(AppService(storage));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConst.appName,
      theme: ThemeData(
        primarySwatch: AppStyle.appTheme,
      ),
      initialRoute: AppRoute.defaultRoute,
      unknownRoute: GetPage(
          name: AppRoute.notFound, page: () => const UnknownRoutePage()),
      getPages: AppRoute.pages,
    );
  }
}

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('No route defined for this page')),
    );
  }
}

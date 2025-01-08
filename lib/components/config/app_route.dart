// ignore_for_file: unused_import

import 'package:based_project_list_club_sepak_bola/features/dummy-item/binding/dummy_item_binding.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy-item/presentation/dummy_item_screen.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy/binding/dummy_binding.dart';
import 'package:based_project_list_club_sepak_bola/features/dummy/presentation/dummy_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../main.dart';

class AppRoute {
  static const String defaultRoute = '/';
  static const String detailScreen = '/detailScreen';
  static const String notFound = '/notFound';

  static List<GetPage> pages = [
    GetPage(
      name: defaultRoute, 
      page: () => const DummyScreen(),
      binding: DummyBinding()),
    GetPage(
      name: detailScreen,
      page: () => const DummyItemScreen(),
      binding: DummyItemBinding()
    )  
  ];
}
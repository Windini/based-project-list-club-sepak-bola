import 'package:based_project_list_club_sepak_bola/components/config/app_const.dart';
import 'package:based_project_list_club_sepak_bola/components/config/app_route.dart';
import 'package:based_project_list_club_sepak_bola/components/config/app_style.dart';
import 'package:based_project_list_club_sepak_bola/components/services/NotificationService.dart';
import 'package:based_project_list_club_sepak_bola/components/services/app_service.dart';
import 'package:based_project_list_club_sepak_bola/components/util/storage_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationService notificationService = NotificationService();
  await notificationService.initNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _notificationConfiguration();
  await _dependencyInjection();
  runApp(const MyApp());
}

Future<void> _notificationConfiguration() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    Logger().i("Izin Notifikasi diberikan");
  } else {
    Logger().i('Izin notifikasi ditolak');
  }
  messaging.getToken().then((String? token) {
    if (token != null) {
      Logger().i('FCM Token: $token');
    }
  });
  FirebaseMessaging.onMessage.listen((onData) {
    NotificationService().showNotification(
        title: onData.notification?.title, body: onData.notification?.body);
  });
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

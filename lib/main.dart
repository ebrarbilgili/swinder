import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'core/cache/shared/shared_pref_cache.dart';
import 'core/constants/app.dart';
import 'core/constants/theme/theme_constant.dart';
import 'core/provider/cache_provider.dart';
import 'core/service/Locations/location_service.dart';
import 'core/widgets/RateAppWidget/rate_app_init_widget.dart';
import 'features/Splash/splash.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('message:  ${message.messageId}');
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  await EasyLocalization.ensureInitialized();
  await SharedPreferencesConstant.preferencesInit();
}

Future<void> main() async {
  await init();
  var messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onBackgroundMessage(
      (message) => _firebaseMessagingBackgroundHandler(message));

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(
    EasyLocalization(
      supportedLocales: AppConstants.SUPPORTED_LOCALE,
      fallbackLocale: AppConstants.EN_LOCALE,
      path: AppConstants.LANG_PATH,
      child: MultiProvider(
        providers: [
          Provider<CacheProvider>(create: (context) => CacheProvider()),
          Provider<LocationService>(
              create: (context) => LocationService(), lazy: false),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((event) {
      var notification = event.notification;
      if (notification != null) {}
    });
    return MaterialApp(
      title: 'Swinder for Instagram',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      theme: ThemeConstant.instance.themeData,
      home: RateAppInitWidget(
        builder: (rateMyApp) => SplashView(),
      ),
    );
  }
}

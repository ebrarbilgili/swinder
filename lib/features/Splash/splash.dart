import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app.dart';
import '../../core/provider/cache_provider.dart';
import '../../core/service/Locations/location_service.dart';
import '../HomeView/view/home_view.dart';
import '../LoginView/view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> controlToApp(BuildContext context) async {
    final readCacheProvider = context.read<CacheProvider>();
    await context
        .read<LocationService>()
        .getCurrentLocation()
        .whenComplete(() async {
      if (readCacheProvider.getStringCache('username') != null) {
        await context.navigation.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeView(
                username: readCacheProvider.getStringCache('username'),
                mySex: readCacheProvider.getStringCache('mySex'),
                chooseSex: readCacheProvider.getStringCache('chooseSex'),
              ),
            ),
            (route) => false);
      } else {
        await context.navigation.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginView()),
            (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      controlToApp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppConstants.LOGO,
          fit: BoxFit.fitWidth,
          // scale: context.dynamicHeight(0.0008),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppConstants {
  static const LOGO = 'assets/logo2.png';

  static const BASE_URL = 'https://www.swinderapp.com/swinder/swinder.php';
  static const INSTA_URL = 'https://www.instagram.com';
  static const RANDOM_IMAGE = 'https://www.gravatar.com/avatar/?d=mp&s=200';
  static const INSTA_IMAGE =
      'https://instagram.fsaw1-13.fna.fbcdn.net/v/t51.2885-19/s320x320/161611854_2830356173873496_5415463008001429648_n.jpg?tp=1&_nc_ht=instagram.fsaw1-13.fna.fbcdn.net&_nc_ohc=_2mHXt-57LcAX92JuwB&edm=ABfd0MgBAAAA&ccb=7-4&oh=e77f437d0cd76310125fb710b50e0ff4&oe=60C843B9&_nc_sid=7bff83';

  static const SUPPORTED_LOCALE = [
    AppConstants.EN_LOCALE,
    AppConstants.TR_LOCALE
  ];

  static const TR_LOCALE = Locale('tr', 'TR');
  static const EN_LOCALE = Locale('en', 'UK');
  static const LANG_PATH = 'assets/locales';
}

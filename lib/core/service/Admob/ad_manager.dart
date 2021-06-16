import 'dart:io';

class AdManager {
  static String get appId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7187065669339509~9605589792';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3609817344895331~5493076664';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3609817344895331/7101494196';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3609817344895331/9464111263';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3609817344895331/6203028262';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3609817344895331/6071661167';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return '<YOUR_ANDROID_REWARDED_AD_UNIT_ID>';
  //   } else if (Platform.isIOS) {
  //     return '<YOUR_IOS_REWARDED_AD_UNIT_ID>';
  //   } else {
  //     throw new UnsupportedError('Unsupported platform');
  //   }
  // }
}

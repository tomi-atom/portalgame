import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  static String getAdUnitId() {
    if (Platform.isAndroid) {
      // Gunakan ini jika perangkat adalah Android
      return 'ca-app-pub-5082169806538743/7880016443';
    } else if (Platform.isIOS) {
      // Gunakan ini jika perangkat adalah iOS
      return 'ca-app-pub-5082169806538743/7880016443';
    } else {
      throw UnsupportedError('Platform tidak didukung');
    }
  }

  static BannerAd createBannerAd(AdSize adSize, BannerAdListener listener) {
    return BannerAd(
      size: adSize,
      adUnitId: getAdUnitId(),
      request: const AdRequest(),
      listener: listener,
    );
  }



}

import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_config.dart';

class AdManager {
  static String getAdUnitId() {
    if (Platform.isAndroid) {
      // Gunakan ini jika perangkat adalah Android
      return AdConfig.bannerAdUnitId;
    } else if (Platform.isIOS) {
      // Gunakan ini jika perangkat adalah iOS
      return AdConfig.bannerAdUnitId;
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

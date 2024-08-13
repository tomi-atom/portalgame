import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_config.dart';

class BannerAdService {
  late BannerAd bannerAd;

  BannerAdService() {
    bannerAd = BannerAd(
      adUnitId: AdConfig.bannerAdUnitId, // AdUnitId Banner test
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(),
    )..load();
  }
}

class InterstitialAdService {
  InterstitialAd? _interstitialAd;
  bool get isAdLoaded => _interstitialAd != null;

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdConfig.interstitialAdUnitId, // Use your actual Ad Unit ID
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          print('Interstitial Ad loaded.');
        },
        onAdFailedToLoad: (error) {
          print('Interstitial Ad failed to load: ${error.message}');
          _interstitialAd = null;
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
    } else {
      print('Interstitial Ad is not ready.');
    }
  }

  void dispose() {
    _interstitialAd?.dispose();
  }
}

class RewardedAdService {
  RewardedAd? _rewardedAd;

  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdConfig.rewardedAdUnitId, // AdUnitId Rewarded test
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          print('Rewarded Ad failed to load: ${error.message}');
          _rewardedAd = null;
        },
      ),
    );
  }

  void showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          print('User earned reward: ${reward.amount} ${reward.type}');
        },
      );
      _rewardedAd = null;
    } else {
      print('Rewarded Ad is not ready.');
    }
  }
}

class NativeAdService {
  NativeAd? nativeAd;

  NativeAdService() {
    nativeAd = NativeAd(
      adUnitId: AdConfig.nativeAdUnitId, // AdUnitId Native test
      factoryId: 'listTile',
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          print('Native Ad loaded.');
        },
        onAdFailedToLoad: (ad, error) {
          print('Native Ad failed to load: ${error.message}');
          ad.dispose();
        },
      ),
    )..load();
  }
}
class AppOpenAdService {
  AppOpenAd? _appOpenAd;
  bool _isAdAvailable = false;

  void loadAppOpenAd() {
    AppOpenAd.load(
      adUnitId: AdConfig.appOpenAdUnitId, // ID tes untuk App Open Ad
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          print('App Open Ad loaded.');
          _appOpenAd = ad;
          _isAdAvailable = true;
        },
        onAdFailedToLoad: (error) {
          print('App Open Ad failed to load: ${error.message}');
          _appOpenAd = null;
          _isAdAvailable = false;
        },
      ),
      //orientation: AppOpenAd.orientationPortrait, // Jika diperlukan
    );
  }

  void showAppOpenAd() {
    if (_isAdAvailable && _appOpenAd != null) {
      print('Showing App Open Ad');
      _appOpenAd!.show();
      _appOpenAd = null;
      _isAdAvailable = false;
      loadAppOpenAd(); // Muat iklan baru setelah menampilkan yang ada
    } else {
      print('App Open Ad is not ready.');
      loadAppOpenAd(); // Coba muat iklan baru jika belum siap
    }
  }
}
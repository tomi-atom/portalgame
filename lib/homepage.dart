import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final BannerAdService _bannerAdService = BannerAdService();
  final InterstitialAdService _interstitialAdService = InterstitialAdService();
  final RewardedAdService _rewardedAdService = RewardedAdService();
  final NativeAdService _nativeAdService = NativeAdService();
  final AppOpenAdService _appOpenAdService = AppOpenAdService();


  Timer? _interstitialAdTimer;
  Timer? _rewardedAdTimer;
  @override
  void initState() {
    super.initState();
    _interstitialAdService.loadInterstitialAd();
    _rewardedAdService.loadRewardedAd();
    _appOpenAdService.loadAppOpenAd();
    _startInterstitialAdTimer();
    _startRewardedAdTimer();
  }
  void _startInterstitialAdTimer() {
    _interstitialAdTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      _interstitialAdService.showInterstitialAd();
    });
  }

  void _startRewardedAdTimer() {
    _rewardedAdTimer = Timer.periodic(Duration(seconds:25 ), (timer) {
      _rewardedAdService.showRewardedAd();
    });
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _appOpenAdService.showAppOpenAd();
    }
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _interstitialAdTimer?.cancel();
    _rewardedAdTimer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdMob Example'),
      ),
      body: Column(
        children: [
          // Banner Ad
          Container(
            alignment: Alignment.center,
            child: AdWidget(ad: _bannerAdService.bannerAd),
            width: _bannerAdService.bannerAd.size.width.toDouble(),
            height: _bannerAdService.bannerAd.size.height.toDouble(),
          ),
          SizedBox(height: 20),

          // Show Interstitial Ad Button
          ElevatedButton(
            onPressed: () {
              _interstitialAdService.showInterstitialAd();
            },
            child: Text('Show Interstitial Ad'),
          ),
          SizedBox(height: 20),

          // Show Rewarded Ad Button
          ElevatedButton(
            onPressed: () {
              _rewardedAdService.showRewardedAd();
            },
            child: Text('Show Rewarded Ad'),
          ),
          SizedBox(height: 20),

          // Native Ad
          if (_nativeAdService.nativeAd != null)
            Container(
              alignment: Alignment.center,
              child: AdWidget(ad: _nativeAdService.nativeAd!),
              width: double.infinity,
              height: 150, // Adjust height as needed
            ),
          SizedBox(height: 20),

          // Show App Open Ad Button
          ElevatedButton(
            onPressed: () {
              _appOpenAdService.showAppOpenAd();
            },
            child: Text('Show App Open Ad'),
          ),
        ],
      ),
    );
  }
}

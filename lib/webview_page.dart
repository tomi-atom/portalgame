import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'ad_services.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  final InterstitialAdService _interstitialAdService = InterstitialAdService();
  final RewardedAdService _rewardedAdService = RewardedAdService();
  Timer? _interstitialAdTimer;
  Timer? _rewardedAdTimer;
  @override
  void initState() {
    super.initState();
    _interstitialAdService.loadInterstitialAd();
    _rewardedAdService.loadRewardedAd();
    _startInterstitialAdTimer();
  //  _startRewardedAdTimer();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }
  void _startInterstitialAdTimer() {
    _interstitialAdTimer = Timer.periodic(Duration(minutes: 5), (timer) {
      if (_interstitialAdService.isAdLoaded) {
        _interstitialAdService.showInterstitialAd();
        _interstitialAdService.loadInterstitialAd(); // Reload the ad
      } else {
        print('Interstitial Ad is not ready.');
      }
    });
  }

  void _startRewardedAdTimer() {
    _rewardedAdTimer = Timer.periodic(Duration(minutes:10 ), (timer) {
      _rewardedAdService.showRewardedAd();
    });
  }
  @override
  void dispose() {
    _interstitialAdTimer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}

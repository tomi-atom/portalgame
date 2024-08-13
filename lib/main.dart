import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:portalgame/homepage.dart';
import 'package:portalgame/webview_page.dart';

import 'ad_manager.dart';
import 'ad_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  MobileAds.instance.initialize();
  runApp(PortalApp());
}

class PortalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Add this line
      title: 'Portal Game',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PortalGameHomePage(),
     // home: PortalGameHomePage(),
    );
  }
}

class PortalGameHomePage extends StatefulWidget {
  final AdSize adSize;

  PortalGameHomePage({
    Key? key,
    this.adSize = AdSize.banner,
  }) : super(key: key);

  @override
  _PortalGameHomePageState createState() => _PortalGameHomePageState();
}

class _PortalGameHomePageState extends State<PortalGameHomePage> {
  List<Item> items = [
    Item(name: '1. Junggle Sniper',  image: 'assets/junglesniper300200.webp',link : 'https://cdn.htmlgames.com/JungleSniper/'),
    Item(name: '2. Bumble Tumble',  image: 'assets/bumbletumble300200.webp',link : 'https://cdn.htmlgames.com/BumbleTumble/'),
    Item(name: '3. Double Klondike',  image: 'assets/doubleklondike300200.webp',link : 'https://cdn.htmlgames.com/DoubleKlondike/'),
    Item(name: '4. Balloon Maze',  image: 'assets/balloonmaze300200.webp',link : 'https://cdn.htmlgames.com/BalloonMaze/'),
    Item(name: '5. Kitty Mahjong',  image: 'assets/kittymahjong300200.webp',link : 'https://cdn.htmlgames.com/KittyMahjong/'),
    Item(name: '6. Mysterious Pirate Jewels 3', image: 'assets/mysteriouspiratejewels3300200.webp', link: 'https://cdn.htmlgames.com/MysteriousPirateJewels3/'),
    Item(name: '7. Pyramid Solitaire  ', image: 'assets/pyramidsolitaire-ancientchina300200.webp', link: 'https://cdn.htmlgames.com/PyramidSolitaireAncientChina/'),
    Item(name: '8. Aladdin Solitaire', image: 'assets/aladdinsolitaire300200.webp', link: 'https://cdn.htmlgames.com/AladdinSolitaire/'),
    Item(name: '9. Tetris Puzzle', image: 'assets/tetrispuzzle300200.webp', link: 'https://cdn.htmlgames.com/TetrisPuzzle/'),
    Item(name: '10. Mahjong Move & Match', image: 'assets/mahjongmove&match300200.webp', link: 'https://cdn.htmlgames.com/MahjongMoveAndMatch/'),
    Item(name: '11. Barcelona Hidden Objects', image: 'assets/barcelonahiddenobjects300200.webp', link: 'https://cdn.htmlgames.com/BarcelonaHiddenObjects/'),
    Item(name: '12. Puzzle Drop - Space Adventure', image: 'assets/puzzledropspaceadventure300200.webp', link: 'https://cdn.htmlgames.com/PuzzleDropSpaceAdventure/'),
    Item(name: '13. Tap It Away 3D', image: 'assets/tapitaway3d300200.webp', link: 'https://cdn.htmlgames.com/TapItAway3D/'),
    Item(name: '14. Zig Zag Gate', image: 'assets/zigzaggate300200.webp', link: 'https://cdn.htmlgames.com/ZigZagGate/'),
    Item(name: '15. Happy Bees', image: 'assets/happybees300200.webp', link: 'https://cdn.htmlgames.com/HappyBees/'),
    Item(name: '16. JapanJong', image: 'assets/japanjong300200.webp', link: 'https://cdn.htmlgames.com/JapanJong/'),
    Item(name: '17. Freecell Extreme', image: 'assets/freecellextreme300200.webp', link: 'https://cdn.htmlgames.com/FreecellExtreme/'),
    Item(name: '18. Ninja Breakout', image: 'assets/ninjabreakout300200.webp', link: 'https://cdn.htmlgames.com/NinjaBreakout/'),
    Item(name: '19. Bubble Throw ', image: 'assets/bubblethrow300200.webp', link: 'https://cdn.htmlgames.com/BubbleThrow/'),
    Item(name: '20. Circus Mahjong ', image: 'assets/circus-mahjong-300x200.webp', link: 'https://cdn.htmlgames.com/CircusMahjong/'),
    Item(name: '21. Merge Cards', image: 'assets/mergecards300200.webp', link: 'https://cdn.htmlgames.com/MergeCards/'),
    Item(name: '22. Zoo Collapse', image: 'assets/zoocollapse300200.webp', link: 'https://cdn.htmlgames.com/ZooCollapse/'),
    Item(name: '23. Farm Mysteries', image: 'assets/farmmysteries300200.webp', link: 'https://cdn.htmlgames.com/FarmMysteries/'),
    Item(name: '24. Traffic Control', image: 'assets/trafficcontrol300200.webp', link: 'https://cdn.htmlgames.com/TrafficControl/'),
    Item(name: '25. Daily Queens', image: 'assets/daily-queens-300x200.webp', link: 'https://cdn.htmlgames.com/DailyQueens/'),
    // Item(name: '26. ', image: 'assets/', link: ''),
    // Item(name: '27. ', image: 'assets/', link: ''),
    // Item(name: '28. ', image: 'assets/', link: ''),
    // Item(name: '29. ', image: 'assets/', link: ''),
    // Item(name: '30. ', image: 'assets/', link: ''),
    // Item(name: '31. ', image: 'assets/', link: ''),
    // Item(name: '32. ', image: 'assets/', link: ''),
    // Item(name: '33. ', image: 'assets/', link: ''),
    // Item(name: '34. ', image: 'assets/', link: ''),
    // Item(name: '35. ', image: 'assets/', link: ''),
    // Item(name: '36. ', image: 'assets/', link: ''),
    // Item(name: '37. ', image: 'assets/', link: ''),
    // Item(name: '38. ', image: 'assets/', link: ''),
    // Item(name: '39. ', image: 'assets/', link: ''),
    // Item(name: '40. ', image: 'assets/', link: ''),
    // Item(name: '41. ', image: 'assets/', link: ''),
    // Item(name: '42. ', image: 'assets/', link: ''),
    // Item(name: '43. ', image: 'assets/', link: ''),
    // Item(name: '44. ', image: 'assets/', link: ''),
    // Item(name: '45. ', image: 'assets/', link: ''),
    // Item(name: '46. ', image: 'assets/', link: ''),
    // Item(name: '47. ', image: 'assets/', link: ''),
    // Item(name: '48. ', image: 'assets/', link: ''),
    // Item(name: '49. ', image: 'assets/', link: ''),
    // Item(name: '50. ', image: 'assets/', link: ''),
    // Item(name: '51. ', image: 'assets/', link: ''),
    // Item(name: '52. ', image: 'assets/', link: ''),
    // Item(name: '53. ', image: 'assets/', link: ''),
    // Item(name: '54. ', image: 'assets/', link: ''),
    // Item(name: '55. ', image: 'assets/', link: ''),
    // Item(name: '56. ', image: 'assets/', link: ''),
    // Item(name: '57. ', image: 'assets/', link: ''),
    // Item(name: '58. ', image: 'assets/', link: ''),
    // Item(name: '59. ', image: 'assets/', link: ''),
    // Item(name: '60. ', image: 'assets/', link: ''),
    // Item(name: '61. ', image: 'assets/', link: ''),
    // Item(name: '62. ', image: 'assets/', link: ''),
    // Item(name: '63. ', image: 'assets/', link: ''),
    // Item(name: '64. ', image: 'assets/', link: ''),
    // Item(name: '65. ', image: 'assets/', link: ''),
    // Item(name: '66. ', image: 'assets/', link: ''),
    // Item(name: '67. ', image: 'assets/', link: ''),
    // Item(name: '68. ', image: 'assets/', link: ''),
    // Item(name: '69. ', image: 'assets/', link: ''),
    // Item(name: '70. ', image: 'assets/', link: ''),
    // Item(name: '71. ', image: 'assets/', link: ''),
    // Item(name: '72. ', image: 'assets/', link: ''),
    // Item(name: '73. ', image: 'assets/', link: ''),
    // Item(name: '74. ', image: 'assets/', link: ''),
    // Item(name: '75. ', image: 'assets/', link: ''),
    // Item(name: '76. ', image: 'assets/', link: ''),
    // Item(name: '77. ', image: 'assets/', link: ''),
    // Item(name: '78. ', image: 'assets/', link: ''),
    // Item(name: '79. ', image: 'assets/', link: ''),
    // Item(name: '80. ', image: 'assets/', link: ''),
    // Item(name: '81. ', image: 'assets/', link: ''),
    // Item(name: '82. ', image: 'assets/', link: ''),
    // Item(name: '83. ', image: 'assets/', link: ''),
    // Item(name: '84. ', image: 'assets/', link: ''),
    // Item(name: '85. ', image: 'assets/', link: ''),
    // Item(name: '86. ', image: 'assets/', link: ''),
    // Item(name: '87. ', image: 'assets/', link: ''),
    // Item(name: '88. ', image: 'assets/', link: ''),
    // Item(name: '89. ', image: 'assets/', link: ''),
    // Item(name: '90. ', image: 'assets/', link: ''),
    // Item(name: '91. ', image: 'assets/', link: ''),
    // Item(name: '92. ', image: 'assets/', link: ''),
    // Item(name: '93. ', image: 'assets/', link: ''),
    // Item(name: '94. ', image: 'assets/', link: ''),
    // Item(name: '95. ', image: 'assets/', link: ''),
    // Item(name: '96. ', image: 'assets/', link: ''),
    // Item(name: '97. ', image: 'assets/', link: ''),
    // Item(name: '98. ', image: 'assets/', link: ''),
    // Item(name: '99. ', image: 'assets/', link: ''),
    // Item(name: '100. ', image: 'assets/', link: ''),
  ];

  late List<Item> filteredItems;
  late TextEditingController searchController;
  Map<String, int> boughtItemsMap = {};
  late List<BannerAd?> _bannerAds = [];
  late List<bool> _isAdLoaded = [];
  final int maxAds = 10;
  final InterstitialAdService _interstitialAdService = InterstitialAdService();
  Timer? _interstitialAdTimer;
  @override
  void initState() {
    searchController = TextEditingController();
    filteredItems = items;
    _loadBannerAds();
    _interstitialAdService.loadInterstitialAd();
    _startInterstitialAdTimer();
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    searchController.addListener(() {
      filterItems();
    });
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
  void filterItems() {
    setState(() {
      String query = searchController.text.toLowerCase();
      filteredItems = items.where((item) {
        return item.name.toLowerCase().contains(query);
      }).toList();
    });
  }
  void _loadBannerAds() {
    for (int i = 0; i < maxAds; i++) {
      BannerAd bannerAd = BannerAd(
        adUnitId: AdManager.getAdUnitId(),
        size: AdSize.banner,
        request: AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (_) {
            setState(() {
              _isAdLoaded.add(true);
            });
          },
          onAdFailedToLoad: (_, error) {
            debugPrint('BannerAd failed to load: $error');
            _isAdLoaded.add(false);
          },
        ),
      );

      bannerAd.load();
      _bannerAds.add(bannerAd);
    }
  }

  @override
  void dispose() {
    for (BannerAd? bannerAd in _bannerAds) {
      bannerAd?.dispose();
    }
    _interstitialAdTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search games',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length + (_bannerAds.length > 0 ? (_bannerAds.length ~/ 6) : 0),
              itemBuilder: (BuildContext context, int index) {
                if (_isAdLoaded.isNotEmpty && index != 0 && (index + 1) % 6 == 0) {
                  int adIndex = (index + 1) ~/ 6 - 1;
                  return Container(
                    height: _bannerAds[adIndex]?.size.height.toDouble() ?? 0,
                    child: AdWidget(ad: _bannerAds[adIndex]!),
                  );
                } else {
                  final itemIndex = index - (index ~/ 6);
                  if (itemIndex >= filteredItems.length) {
                    return SizedBox.shrink();
                  }
                  final item = filteredItems[itemIndex];
                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      leading: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(item.image, fit: BoxFit.cover),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WebViewPage(url: item.link),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        child: Text(
                          'Play',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
  String _formatCurrency(double amount) {
    var formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatCurrency.format(amount);
  }


}

class Item {
  final String name;
  final String image;
  final String link;

  Item({required this.name, required this.image, required this.link});
}




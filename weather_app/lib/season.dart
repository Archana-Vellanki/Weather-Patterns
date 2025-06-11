import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'season_page.dart';
import 'translation_service.dart';

class SeasonSlideshowPage extends StatefulWidget {
  const SeasonSlideshowPage({super.key});

  @override
  State<SeasonSlideshowPage> createState() => _SeasonSlideshowPageState();
}

class _SeasonSlideshowPageState extends State<SeasonSlideshowPage> {
  bool _isSpanish = false;
  bool _isTranslating = false;
  int _currentPageIndex = 0;
  final FlutterTts _flutterTts = FlutterTts();

  final List<Map<String, dynamic>> _seasons = [
    {
      'title': 'Summer',
      'image': 'assets/summer.png',
      'description': '🌡️ Hottest season of the year.  \n☀️ Long, sunny days and short nights. \n🏖️ Time for vacations, beach trips, and outdoor fun.  \n🍦 People enjoy ice cream and cold drinks.  \n🏊 Swimming, picnics, and playing outside are common.  \n👕 Light clothes like t-shirts and shorts are worn.  \n🌳 Trees are full of green leaves and flowers bloom.  \n🧴 Remember to wear sunscreen and drink water!',
      'gradient': const LinearGradient(
        colors: [Color(0x80FFD700), Color(0x80FF8C00)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )
    },
    {
      'title': 'Fall',
      'image': 'assets/fall.png',
      'description': '🍂 Leaves change colors to red, orange, and yellow.\n🍁 Leaves fall from trees and make crunchy piles.\n🧥 Weather becomes cool; time for sweaters and jackets.\n🎃 Pumpkins, apples, and corn are harvested.\n🐿️ Animals gather food for the coming winter.\n🌾 Farmers celebrate harvest festivals.\n🏞️ Perfect time for nature walks and outdoor fun.\n🍏 Fall feels cozy and colorful!',
      'gradient': const LinearGradient(
        colors: [Color(0x80FFA726), Color(0x80D84315)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )
    },
    {
      'title': 'Winter',
      'image': 'assets/winter.png',
      'description': '🥶 Coldest season of the year.\n🌙 Short days and long, chilly nights.\n⛄ Snow falls in many places, perfect for snowmen!\n🧤 People wear warm clothes like jackets, scarves, and gloves.\n🎿 Fun activities include ice skating and skiing.\n🐻 Some animals rest or hibernate during winter.\n☕ Hot cocoa and warm soups are favorites.\n🎄 Winter brings holidays and festive joy!',
      'gradient': const LinearGradient(
        colors: [Color(0x80E1F5FE), Color(0x80B3E5FC)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )
    },
    {
      'title': 'Spring',
      'image': 'assets/spring.png',
      'description': '🌷 Flowers bloom and trees grow new green leaves.\n🐣 Baby animals like chicks and lambs are born.\n🌦️ Rain showers help plants and flowers grow.\n🌞 Days get longer and warmer after winter.\n🧑‍🌾 People plant gardens and enjoy nature.\n🐝 Bees and butterflies are busy with flowers.\n🚲 Great time for bike rides and playing outside.\n🌼 Spring brings new life and a fresh start!',
      'gradient': const LinearGradient(
        colors: [Color(0x80E6F5E9), Color(0x80FFF3E0)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )
    },
  ];

  @override
  void initState() {
    super.initState();
    _precacheTranslations();
    _flutterTts.setLanguage("en-US");
  }

  Future<void> _precacheTranslations() async {
    final allTexts = _seasons
        .map((s) => [s['title'] as String, s['description'] as String])
        .expand((i) => i)
        .toList();
    await TranslationService.preCacheTranslations(allTexts, 'es');
  }

  Future<void> _toggleLanguage() async {
    setState(() => _isTranslating = true);
    _isSpanish = !_isSpanish;
    await _flutterTts.setLanguage(_isSpanish ? 'es-ES' : 'en-US');
    setState(() => _isTranslating = false);
  }

  Future<void> _speakCurrentSeasonText() async {
    final season = _seasons[_currentPageIndex];
    final text = '${season['title']}. ${season['description']}';
    await _flutterTts.stop();
    await _flutterTts.speak(text);
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() => _currentPageIndex = index);
            },
            children: _seasons.map<Widget>((season) => SeasonPage(
              title: season['title'] as String,
              imagePath: season['image'] as String,
              description: season['description'] as String,
              gradient: season['gradient'] as LinearGradient,
              isSpanish: _isSpanish,
              isTranslating: _isTranslating,
              onTranslate: _toggleLanguage,
            )).toList(),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Row(
              children: [
                _buildAudioButton(),
                const SizedBox(width: 8),
                _buildTranslateButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioButton() {
    return IconButton(
      icon: const Icon(Icons.volume_up, color: Colors.white, size: 32),
      onPressed: _speakCurrentSeasonText,
    );
  }

  Widget _buildTranslateButton() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _isTranslating
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : IconButton(
              key: const ValueKey('translate-btn'),
              icon: Icon(
                Icons.translate,
                color: _isSpanish ? Colors.blue[200] : Colors.white,
                size: 32,
              ),
              onPressed: _toggleLanguage,
            ),
    );
  }
}

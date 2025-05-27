import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'translation_service.dart';

class WeatherPattern {
  final String title;
  final String imagePath;
  final String description;
  final String funFact;
  final Color primaryColor;

  const WeatherPattern({
    required this.title,
    required this.imagePath,
    required this.description,
    required this.funFact,
    required this.primaryColor,
  });
}

class WeatherPatternPage extends StatefulWidget {
  const WeatherPatternPage({super.key});

  @override
  State<WeatherPatternPage> createState() => _WeatherPatternPageState();
}

class _WeatherPatternPageState extends State<WeatherPatternPage> {
  int _currentIndex = 0;
  bool _isSpanish = false;
  bool _isTranslating = false;
  final PageController _pageController = PageController();
  final FlutterTts _flutterTts = FlutterTts();

  final List<WeatherPattern> _weatherPatterns = [
    WeatherPattern(
      title: "Sunny Day Delight!",
      imagePath: "assets/weather_pattern/sunny_day.png",
      description: "Woohoo! The big, bright sun is smiling in a clear blue sky. It's a perfect day for running, jumping, and playing outside adventures!",
      funFact: "Sunlight travels super fast from the sun to Earth – it takes about 8 minutes! And it helps plants grow tall and gives us Vitamin D for strong bones.",
      primaryColor: Colors.amber,
    ),
    WeatherPattern(
      title: "Cloudy Sky Wonders",
      imagePath: "assets/weather_pattern/cloudy_weather.png",
      description: "Look up! The sky is filled with fluffy, floating clouds. Sometimes they're like giant cotton balls, and other times they cover the sky like a soft, grey blanket.",
      funFact: "You can be a cloud detective! Lie on your back and watch the clouds. Do you see shapes like animals, faces, or even a dragon? Clouds are always changing!",
      primaryColor: Colors.blueGrey,
    ),
    WeatherPattern(
      title: "Peek-a-Boo Partly Cloudy",
      imagePath: "assets/weather_pattern/partly_cloudy.png",
      description: "It's a playful sky today! The sun is playing hide-and-seek with the clouds. You'll get warm sunshine, then cool shade, then sunshine again!",
      funFact: "Those beautiful rays of sunlight peeking through the clouds are called sunbeams! Sometimes they look like magical ladders to the sky.",
      primaryColor: Colors.lightBlue.shade300,
    ),
    WeatherPattern(
      title: "Rainy Day Rhythms",
      imagePath: "assets/weather_pattern/rainy_day.png",
      description: "Pitter-patter, drip-drop! Hear the rain? It's washing the world clean and making everything fresh. Time for cozy indoor games or puddle-stomping fun!",
      funFact: "Raindrops race each other to the ground! And guess what? Not all raindrops are tear-shaped; tiny ones are perfectly round like little balls!",
      primaryColor: Colors.blue.shade700,
    ),
    WeatherPattern(
      title: "Snowy Wonderland",
      imagePath: "assets/weather_pattern/snowy_weather.png",
      description: "Wow! Everything is turning white and sparkly! Soft, cold snowflakes are gently dancing down, covering the world in a magical, quiet blanket.",
      funFact: "It's true, no two snowflakes are exactly alike! Each one is a tiny, six-sided ice crystal masterpiece. Imagine counting them all!",
      primaryColor: Colors.lightBlue.shade100,
    ),
    WeatherPattern(
      title: "Whooshing Windy Day!",
      imagePath: "assets/weather_pattern/windy.png",
      description: "Whoosh! Hold onto your hats! The wind is showing off today, making trees sway, flags flap, and leaves swirl in a playful dance.",
      funFact: "Wind is just air on the move! It can fly kites super high, help big ships sail across the ocean, and even make electricity with giant windmills!",
      primaryColor: Colors.teal.shade300,
    ),
    WeatherPattern(
      title: "Booming Thunderstorm!",
      imagePath: "assets/weather_pattern/thunderstorm.png",
      description: "Kaboom! Flash! A thunderstorm is nature's exciting sound and light show! Dark clouds bring flashing lightning and rumbling thunder, usually with heavy rain.",
      funFact: "Lightning is super powerful – hotter than the surface of the sun! Always stay safely inside during a thunderstorm and enjoy the show from a window.",
      primaryColor: Colors.deepPurple.shade400,
    ),
    WeatherPattern(
      title: "Misty Foggy Day",
      imagePath: "assets/weather_pattern/foggy_day.png",
      description: "Shhh... it's like walking inside a soft, white cloud that has come down to visit the ground! Fog makes everything look mysterious and quiet.",
      funFact: "Fog is made of zillions of tiny water droplets hanging in the air. Sometimes, on a hill, you can be above the fog and see it looking like a sea of clouds below!",
      primaryColor: Colors.grey.shade500,
    ),
    WeatherPattern(
      title: "Spectacular Rainbow!",
      imagePath: "assets/weather_pattern/rainbow.png",
      description: "Amazing! A beautiful arc of colors has painted the sky! Rainbows are like a special treat from nature after the rain when the sun peeks out.",
      funFact: "A rainbow is actually a full circle, but we usually only see a part of it from the ground! To see the whole circle, you'd have to be way up high, like in an airplane.",
      primaryColor: Colors.pinkAccent.shade100,
    ),
  ];

  final Map<int, Map<String, String>> _translatedContent = {};

  @override
  void initState() {
    super.initState();
    _flutterTts.setLanguage("en-US");
  }

  @override
  void dispose() {
    _pageController.dispose();
    _flutterTts.stop();
    super.dispose();
  }

  Future<void> _speakCurrentDescription() async {
    final current = _weatherPatterns[_currentIndex];
    final translated = _translatedContent[_currentIndex];
    final text = _isSpanish ? (translated != null ? translated['description'] : current.description) : current.description;
    await _flutterTts.setLanguage(_isSpanish ? 'es-ES' : 'en-US');
    await _flutterTts.speak(text!);
  }

  Future<void> _toggleLanguage() async {
    setState(() => _isTranslating = true);
    _isSpanish = !_isSpanish;

    if (_isSpanish) {
      for (int i = 0; i < _weatherPatterns.length; i++) {
        if (!_translatedContent.containsKey(i)) {
          final translatedTitle = await TranslationService.translate(_weatherPatterns[i].title, 'es');
          final translatedDesc = await TranslationService.translate(_weatherPatterns[i].description, 'es');
          final translatedFact = await TranslationService.translate(_weatherPatterns[i].funFact, 'es');
          _translatedContent[i] = {
            'title': translatedTitle,
            'description': translatedDesc,
            'funFact': translatedFact,
          };
        }
      }
    }

    setState(() => _isTranslating = false);
  }

  void _goToNextWeather() {
    final nextIndex = (_currentIndex + 1) % _weatherPatterns.length;
    _pageController.animateToPage(nextIndex, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _goToPreviousWeather() {
    final prevIndex = _currentIndex - 1 < 0 ? _weatherPatterns.length - 1 : _currentIndex - 1;
    _pageController.animateToPage(prevIndex, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final current = _weatherPatterns[_currentIndex];
    final translated = _translatedContent[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Patterns", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: current.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up, color: Colors.white),
            onPressed: _speakCurrentDescription,
          ),
          _isTranslating
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.translate, color: Colors.white),
                  onPressed: _toggleLanguage,
                ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemCount: _weatherPatterns.length,
              itemBuilder: (context, index) {
                final pattern = _weatherPatterns[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: pattern.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: pattern.primaryColor, width: 3),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Image.asset(
                        pattern.imagePath,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
              ),
              child: Column(
                children: [
                  Text(
                    _isSpanish ? (translated?['title'] ?? current.title) : current.title,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: current.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            _isSpanish ? (translated?['description'] ?? current.description) : current.description,
                            style: const TextStyle(fontSize: 20, height: 1.3),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: current.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: current.primaryColor.withOpacity(0.3), width: 2),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  _isSpanish ? "Dato Curioso:" : "Fun Fact:",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: current.primaryColor),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  _isSpanish ? (translated?['funFact'] ?? current.funFact) : current.funFact,
                                  style: const TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _goToPreviousWeather,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Previous"),
                  style: ElevatedButton.styleFrom(backgroundColor: current.primaryColor),
                ),
                ElevatedButton.icon(
                  onPressed: _goToNextWeather,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text("Next"),
                  style: ElevatedButton.styleFrom(backgroundColor: current.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

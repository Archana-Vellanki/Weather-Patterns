import 'package:flutter/material.dart';

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
  final PageController _pageController = PageController();
  
  final List<WeatherPattern> _weatherPatterns = [
  // --- Your Original Patterns with Enhanced Content ---
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

  // --- Additional Weather Patterns ---
  WeatherPattern(
    title: "Hailing Ice Balls!",
    imagePath: "assets/weather_pattern/ice_balls.png",
    description: "Tap, tap, tap! What's that noise? It's hail! Little balls of ice are bouncing down from the sky. Sometimes they're tiny like peas, sometimes bigger!",
    funFact: "Hailstones are like icy onions! They grow layers of ice as they are tossed up and down inside big, tall thunderstorm clouds before they fall to the ground.",
    primaryColor: Colors.cyan.shade600,
  ),
  WeatherPattern(
    title: "Frosty Sparkle Morning",
    imagePath: "assets/weather_pattern/frosty_sparkling_morning.png",
    description: "Wow! Look around! The world is sparkling with tiny ice crystals. That's frost! It's like nature's glitter, making grass and windows shine.",
    funFact: "Frost loves to draw! It creates beautiful, feathery patterns, especially on windows. Each pattern is a unique piece of cold-weather art!",
    primaryColor: Colors.lightBlue.shade200,
  ),
  WeatherPattern(
    title: "Slippery Sleet Mix!",
    imagePath: "assets/weather_pattern/slippery_day.png",
    description: "Brrr! It's an icy mix! Sleet is like tiny, frozen raindrops, or small, partly melted snowflakes. It can make the ground very slippery, so walk carefully!",
    funFact: "Sleet is a bit of a weather mash-up! It often starts as snow, melts into rain as it falls through warmer air, then re-freezes into tiny ice pellets before hitting the ground.",
    primaryColor: Colors.blueGrey.shade400,
  ),
  WeatherPattern(
    title: "Gentle Dew Drops",
    imagePath: "assets/weather_pattern/hew_drop.png",
    description: "Good morning! Look closely at the leaves and grass. See those tiny water droplets? That's dew! It appears when the cool night air makes moisture gather.",
    funFact: "Spiders use dew drops! Some spider webs look extra beautiful in the morning covered in dew, like a necklace of tiny diamonds.",
    primaryColor: Colors.green.shade300,
  ),
  WeatherPattern(
    title: "Mysterious Mist",
    imagePath: "assets/weather_pattern/mystery_mist.png",
    description: "It's a misty day! Mist is like a very thin fog, where tiny water droplets hang in the air. You can still see through it, but everything looks soft and a bit dreamy.",
    funFact: "Mist often forms near rivers, lakes, or oceans, especially in the morning or evening when the air is cool and calm. It can make a landscape look magical!",
    primaryColor: Colors.grey.shade400,
  ),
];


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextWeather() {
    final nextIndex = (_currentIndex + 1) % _weatherPatterns.length;
    _pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToPreviousWeather() {
    final previousIndex = _currentIndex - 1 < 0 ? _weatherPatterns.length - 1 : _currentIndex - 1;
    _pageController.animateToPage(
      previousIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final WeatherPattern currentPattern = _weatherPatterns[_currentIndex];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather Patterns",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: currentPattern.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              currentPattern.primaryColor,
              currentPattern.primaryColor.withOpacity(0.6),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Image Carousel
              Expanded(

                flex: 3,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemCount: _weatherPatterns.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: _weatherPatterns[index].primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _weatherPatterns[index].primaryColor,
                            width: 3,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          child: Image.asset(
                            _weatherPatterns[index].imagePath,
                            fit: BoxFit.fitWidth,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Information Panel
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Weather Title
                      Text(
                        currentPattern.title,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: currentPattern.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Weather Description
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                currentPattern.description,
                                style: const TextStyle(
                                  fontSize: 20,
                                  height: 1.3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Fun Fact or Tip
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: currentPattern.primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: currentPattern.primaryColor.withOpacity(0.3),
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Fun Fact:",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: currentPattern.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      currentPattern.funFact,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
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
              
              // Navigation Buttons - Moved below the content
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _goToPreviousWeather,
                      icon: const Icon(Icons.arrow_back_rounded, size: 30),
                      label: const Text(
                        "Previous",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentPattern.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _goToNextWeather,
                      label: const Text(
                        "Next",
                        style: TextStyle(fontSize: 20),
                      ),
                      icon: const Icon(Icons.arrow_forward_rounded, size: 30),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentPattern.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
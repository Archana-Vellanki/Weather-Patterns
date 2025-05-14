import 'package:flutter/material.dart';
import 'package:hello_app/season.dart';
import 'package:hello_app/quiz_me_weather.dart';
import 'package:hello_app/water_cycle.dart';


void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with image and icons
          Stack(
            children: [
              Image.asset(
                'assets/home_page.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 30,
                left: 10,
                child: Icon(Icons.translate, color: Colors.green, size: 30),
              ),
              Positioned(
                top: 30,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.person, color: Colors.black, size: 24),
                ),
              ),
            ],
          ),

          // Title
          SizedBox(height: 10),
          Text(
            'Weather Wizards',
            style: TextStyle(
              fontSize: 28,
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontFamily: 'ComicSans', // Optional: for a fun font
            ),
          ),

          SizedBox(height: 20),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFeatureButton('Types of Weather',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SeasonSlideshowPage()),
                  );
                },),
              _buildFeatureButton('Water Cycle',
    () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const WaterCyclePage()),
    );
    },),
              _buildFeatureButton("Let's play!",
    () {
    Navigator.push(
    context,
      MaterialPageRoute(builder: (context) => QuizMeWeatherPage()),
    );
    },),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton(String label, VoidCallback onPressed) {
    return Column(
      children: [
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.yellow,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black, // Needed since TextButton text is white by default
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 60,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        const Icon(Icons.star, color: Colors.yellow, size: 14),
      ],
    );
  }}


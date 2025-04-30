import 'package:flutter/material.dart';

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
                'assets/home_page_header.jpg',
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
              _buildFeatureButton('Types of Weather'),
              _buildFeatureButton('Water Cycle'),
              _buildFeatureButton("Let's play!"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton(String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 4),
        // Mock progress bar
        Container(
          width: 60,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: 0.7, // % complete
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        Icon(Icons.star, color: Colors.yellow, size: 14),
      ],
    );
  }
}


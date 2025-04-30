import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wb_sunny, size: 40, color: Colors.yellow),
                  SizedBox(width: 10),
                  Icon(Icons.cloud, size: 40, color: Colors.grey),
                  SizedBox(width: 10),
                  Icon(Icons.water_drop, size: 40, color: Colors.blue),
                  SizedBox(width: 20),
                  Text(
                    'WEATHER ICONS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Weather Wizards Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Weather Wizards',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            // Cards Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherCard(
                      title: 'Types of Weather',
                      progress: 0.5), // Example progress
                  WeatherCard(
                      title: 'Water Cycle',
                      progress: 0.7), // Example progress
                  WeatherCard(
                      title: 'Lets play!',
                      progress: 0.9), // Example progress
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String title;
  final double progress;

  const WeatherCard({
    Key? key,
    required this.title,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Star Icon
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(height: 5),
            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Progress Bar
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

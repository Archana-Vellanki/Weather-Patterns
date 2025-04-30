import 'package:flutter/material.dart';
import 'season_page.dart'; // Your reusable widget

class SeasonSlideshowPage extends StatelessWidget {
  const SeasonSlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          SeasonPage(
            title: 'Summer',
            imagePath: 'assets/summer.png',
            description: 'Summer or summertime is the hottest and brightest of the four temperate seasons, occurring after spring and before autumn. At or centred on the summer solstice, daylight hours are the longest and darkness hours are the shortest, with day length decreasing as the season progresses after the summer solstice.',
          ),
          SeasonPage(
            title: 'Winter',
            imagePath: 'assets/winter.png',
            description: 'Winter is a chilly season when the weather gets cold and sometimes it snows! People wear warm clothes like jackets, hats, and gloves to stay cozy. Some animals hibernate, which means they sleep through the winter. It’s also a great time for fun things like building snowmen, drinking hot chocolate, and celebrating holidays. Winter is a magical time full of frosty fun!',
            backgroundColor: Color(0xFFE1F5FE),
          ),
          // Add more seasons as needed
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SeasonPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final Color backgroundColor;

  const SeasonPage({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.description,
    this.backgroundColor = const Color(0xFFCCF5FA), // default light blue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  imagePath,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Georgia',
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Icon(Icons.translate, color: Colors.black, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
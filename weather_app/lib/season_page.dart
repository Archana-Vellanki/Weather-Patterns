import 'package:flutter/material.dart';
import 'translation_service.dart';

class SeasonPage extends StatefulWidget {
  final String title;
  final String imagePath;
  final String description;
  final LinearGradient gradient; // Add this line
  final bool isSpanish;
  final bool isTranslating;
  final VoidCallback onTranslate;

  const SeasonPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.gradient, // Add this parameter
    required this.isSpanish,
    required this.isTranslating,
    required this.onTranslate,
  });

  @override
  State<SeasonPage> createState() => _SeasonPageState();
}

class _SeasonPageState extends State<SeasonPage> {
  bool _showDescription = false;
  String _displayTitle = '';
  String _displayDescription = '';

  @override
  void initState() {
    super.initState();
    _updateTexts();
  }

  @override
  void didUpdateWidget(covariant SeasonPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateTexts();
  }

  void _updateTexts() async {
    if (widget.isSpanish) {
      _displayTitle = await TranslationService.translate(widget.title, 'es');
      _displayDescription = await TranslationService.translate(widget.description, 'es');
    } else {
      _displayTitle = widget.title;
      _displayDescription = widget.description;
    }
    if (mounted) setState(() {});
  }

  void _toggleDescription() {
    setState(() => _showDescription = !_showDescription);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleDescription,
      child: Stack(
        fit: StackFit.expand,
        children: [
        // Background Image
        Image.asset(
        widget.imagePath,
        fit: BoxFit.cover,
      ),

      // Gradient Overlay
      Container(
        decoration: BoxDecoration(
          gradient: widget.gradient, // Use the passed gradient
        ),
      ),

      // Title
      Positioned(
        top: MediaQuery.of(context).padding.top + 20,
        left: 20,
        right: 20,
        child: Text(
          widget.isTranslating ? '...' : _displayTitle,
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 10,
                offset: const Offset(2, 2),
              ), // Added missing comma
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),

      // Description Panel
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            bottom: _showDescription ? 0 : -600,
            left: 0,
            right: 0,
            child: Container(
              height: 600,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Text(
                  widget.isTranslating ? '...' : _displayDescription,
                  style: const TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
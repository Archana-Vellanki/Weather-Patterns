import 'package:flutter/material.dart';

class WaterCyclePage extends StatefulWidget {
  const WaterCyclePage({super.key});

  @override
  State<WaterCyclePage> createState() => _WaterCyclePageState();
}

class _WaterCyclePageState extends State<WaterCyclePage> {
  int _stepIndex = 0;

  final List<Map<String, String>> _steps = [
    {
      'text': 'Tap to reveal the first step of the water cycle!',
    },
    {
      'text': 'Evaporation: Water turns into vapor and rises.',
    },
    // {
    //   'image': 'assets/step2_condensation.gif',
    //   'text': 'Condensation: Vapor cools and forms clouds.',
    // },
    // {
    //   'image': 'assets/step3_precipitation.gif',
    //   'text': 'Precipitation: Water falls back as rain.',
    // },
    // {
    //   'image': 'assets/step4_collection.png',
    //   'text': 'Collection: Water gathers in oceans, lakes, and underground.',
    // },
  ];

  void _nextStep() {
    if (_stepIndex < _steps.length - 1) {
      setState(() {
        _stepIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final step = _steps[_stepIndex];

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: GestureDetector(
        onTap: _nextStep,
        child: Stack(
          children: [
            // ✅ Keep background GIF constant
            Positioned.fill(
              child: Image.asset(
                'assets/water_cycle/water_cycle.gif', // Always show this
                fit: BoxFit.contain,
              ),
            ),

            // ✅ Overlays per step
            if (_stepIndex == 1)
              Positioned(
                top: 180,
                left: 80,
                child: Image.asset(
                  'assets/water_cycle/evaporation.gif',
                  width: 400,
                ),
              ),

            // ✅ Step description
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  step['text']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

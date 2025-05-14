import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:google_fonts/google_fonts.dart';

class WaterCyclePage extends StatefulWidget {
  const WaterCyclePage({super.key});

  @override
  State<WaterCyclePage> createState() => _WaterCyclePageState();
}

class _WaterCyclePageState extends State<WaterCyclePage> {
  int _stepIndex = 0;

  final List<Map<String, String>> _steps = [
    {
      'text': '💧 Ever looked up at the sky and wondered — where do those fluffy clouds ☁️ come from? Or how the rain 🌧️ knows just when to fall? Let’s follow the amazing journey of a tiny water droplet through the water cycle! 🌍✨',
    },
    {
      'text': '☀️ Step 1 - Evaporation:\nOn a sunny day, the sun shines down 🌞 and warms the water in oceans 🌊, lakes 🏞️, and puddles. This heat turns water into vapor 💨, which rises high into the sky — our droplet is ready for lift-off! 🎈🚀',
    },
    {
      'text': '☁️ Step 2 - Condensation:\nUp in the cool sky 🌬️, the vapor cools down and joins other droplets 💧. Together, they form soft, puffy clouds ☁️ like a big droplet sleepover in the sky! 🎉🛌',
    },
    {
      'text': '🌧️ Step 3 - Precipitation:\nThe cloud gets crowded 😅 and heavy — it can’t hold all the droplets anymore! Suddenly, droplets fall as rain 💦, snow ❄️, or hail 🌨️ — splashing back to the ground below! 🪂🌎',
    },
    {
      'text': '🌊 Step 4 - Collection:\nWhere does all that water go? Some flows into rivers 🏞️, lakes 🐟, or oceans 🌊, and some soaks into the ground 🌱.It all gathers, waiting for the sun to shine again 🔄 — and the cycle starts all over! ♻️',
    },
    {
      'text': '🎉 Hooray! You’ve completed the full journey of a water droplet! 💧👏 From 🌞 Evaporation, to ☁️ Condensation, 🌧️ Precipitation, and 🌊 Collection — it’s nature’s magical cycle! ✨ \n🔁 Tap “Replay” to go again or 🏠 “Back to Home” to explore more fun!',
    },
  ];


  void _nextStep() {
    if (_stepIndex < _steps.length - 1) {
      setState(() {
        _stepIndex++;
      });
    }
  }

  void _reset() {
    setState(() {
      _stepIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final step = _steps[_stepIndex];

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: GestureDetector(
        onTap: _stepIndex < 5 ? _nextStep : null,
        child: Stack(
          children: [
            // ✅ Step background based on index
            Positioned.fill(
              child: Image.asset(
                'assets/water_cycle/step5.gif',
                fit: BoxFit.contain,
              ),
            ),

            // ✅ Step text
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 850), // Adjust width here
                  child: Bubble(
                    nip: BubbleNip.leftTop, // Or whichever is working for you
                    color: Colors.white.withOpacity(0.9),
                    padding: const BubbleEdges.all(16),
                    child: Text(
                      step['text']!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.comicNeue( // ← you can change this to any Google Font
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),



            // ✅ Final screen buttons
            if (_stepIndex == 5)
              Positioned(
                top: 60,
                right: 50,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: _reset,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        'Replay',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        'Back to Home',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

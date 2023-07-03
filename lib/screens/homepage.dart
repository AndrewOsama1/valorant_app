import 'package:flutter/material.dart';
import 'package:valorant_app/screens/buddies.dart';
import 'package:valorant_app/screens/bundles.dart';
import 'package:valorant_app/screens/gamemodes.dart';
import 'package:valorant_app/screens/lineup.dart';
import 'package:valorant_app/screens/maps.dart';
import 'package:valorant_app/screens/playercards.dart';
import 'package:valorant_app/screens/selectagent.dart';
import 'package:valorant_app/screens/spray.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:valorant_app/widgets/custom_app_bar.dart';
import 'package:valorant_app/widgets/custom_drawer.dart';
import 'package:valorant_app/widgets/glasscard.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Define the animation curve
    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // Define the scale animation
    _animation = Tween<double>(begin: 0.2, end: 1.0).animate(curvedAnimation);

    // Repeat the animation forever
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scrollbar(
        child: Scaffold(
          appBar: const CustomAppBar(),
          drawer: const CustomAppDrawer(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity, // Use the full width available
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontFamily: 'Valorant',
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Welcome to Valorant',
                          speed: const Duration(
                              milliseconds: 200), // Adjust the speed here
                          textAlign: TextAlign.center,
                        ),
                      ],
                      repeatForever:
                          true, // Set to true to repeat the animation indefinitely
                      pause: const Duration(
                          seconds: 1), // Pause duration before animation starts
                      displayFullTextOnTap:
                          true, // Display full text when tapped
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: Image.asset(
                        'assets/images/valorantlogo.png',
                        height: 200.0 * _animation.value,
                        width: 200.0,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2, // Display two cards per row
                    padding: const EdgeInsets.all(
                        16.0), // Margin for the entire grid
                    crossAxisSpacing: 16.0, // Horizontal spacing between cards
                    mainAxisSpacing: 16.0, // Vertical spacing between cards
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AgentScreen()));
                        },
                        child: const GlassCard(
                          imagePath: 'assets/images/sas8.png',
                          text: 'AGents',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PlayerCardsScreen(),
                            ),
                          );
                        },
                        child: const GlassCard(
                          imagePath: 'assets/images/sas5.png',
                          text: 'PlayerCards',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BuddiesScreen(),
                            ),
                          );
                        },
                        child: const GlassCard(
                          imagePath: 'assets/images/sas6.png',
                          text: 'Buddies',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BundleScreen()));
                        },
                        child: const GlassCard(
                          imagePath: 'assets/images/sas1.png',
                          text: 'Bundles',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SprayScreen()));
                        },
                        child: const GlassCard(
                          imagePath: 'assets/images/sas7.png',
                          text: 'sprays',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Game_Mode_Screen()));
                        },
                        child: const GlassCard(
                          imagePath: 'assets/images/sas2.png',
                          text: 'game modes',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MapScreen()));
                        },
                        child: const GlassCard(
                          imagePath: 'assets/images/sas4.png',
                          text: 'maps',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Lineup()));
                        },
                        child: const GlassCard(
                          imagePath: 'assets/images/sas3.png',
                          text: 'Lineup',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

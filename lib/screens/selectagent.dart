import 'package:flutter/material.dart';
import 'package:valorant_app/screens/agentdes.dart';
import 'package:valorant_app/screens/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:valorant_app/widgets/custom_app_bar.dart';
import 'package:valorant_app/widgets/custom_drawer.dart';
import 'package:valorant_app/widgets/mapcard.dart';
import 'dart:convert';

class AgentData {
  final String displayIcon;
  final String displayName;
  final String background;
  final String fullPortrait;
  final String roleIcon;
  final String abilityOne;
  final String abilityTwo;
  final String abilityThree;
  final String desOne;
  final String desTwo;
  final String desThree;
  final String iconOne;
  final String iconTwo;
  final String iconThree;
  final String iconFour;
  final String abilityFour;
  final String desFour;

  AgentData(
      {required this.displayIcon,
      required this.displayName,
      required this.background,
      required this.fullPortrait,
      required this.roleIcon,
      required this.abilityOne,
      required this.abilityThree,
      required this.abilityTwo,
      required this.desOne,
      required this.desThree,
      required this.desTwo,
      required this.iconOne,
      required this.iconThree,
      required this.iconTwo,
      required this.abilityFour,
      required this.desFour,
      required this.iconFour});
}

class AgentScreen extends StatefulWidget {
  const AgentScreen({super.key});

  @override
  AgentScreenState createState() => AgentScreenState();
}

class AgentScreenState extends State<AgentScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<AgentData> mapData = [];

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

    fetchData();
    // Repeat the animation forever
    _animationController.forward();
  }

  Future<void> fetchData() async {
    const url =
        'https://valorant-api.com/v1/agents'; // Replace with your API endpoint
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final maps = data['data'];
      maps.removeAt(9);

      setState(() {
        mapData = maps
            .map<AgentData>((map) => AgentData(
                displayIcon: map['displayIcon'],
                displayName: map['displayName'],
                background: map['background'],
                fullPortrait: map['fullPortraitV2'],
                roleIcon: map['role']['displayIcon'],
                abilityOne: map['abilities'][0]['displayName'],
                abilityTwo: map['abilities'][1]['displayName'],
                abilityThree: map['abilities'][2]['displayName'],
                iconOne: map['abilities'][0]['displayIcon'],
                iconTwo: map['abilities'][1]['displayIcon'],
                iconThree: map['abilities'][2]['displayIcon'],
                desOne: map['abilities'][0]['description'],
                desTwo: map['abilities'][1]['description'],
                desThree: map['abilities'][2]['description'],
                abilityFour: map['abilities'][3]['displayName'],
                desFour: map['abilities'][3]['description'],
                iconFour: map['abilities'][3]['displayIcon']))
            .toList();
      });
    }
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity, // Use the full width available
                child: Text(
                  'Select your Agent',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'Valorant',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepage()));
                },
                child: AnimatedBuilder(
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
              ),
              const SizedBox(height: 50),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Display two cards per row
                    crossAxisSpacing: 16.0, // Horizontal spacing between cards
                    mainAxisSpacing: 16.0, // Vertical spacing between cards
                  ),
                  padding:
                      const EdgeInsets.all(16.0), // Margin for the entire grid
                  itemCount: mapData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final map = mapData[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => YourAgent(
                                agentData: map,
                              ),
                            ));
                        // Handle card tap here
                      },
                      child: MapCardz(
                        imagePath: map.displayIcon,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

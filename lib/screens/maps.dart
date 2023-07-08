import 'package:flutter/material.dart';
import 'package:valorant_app/screens/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:valorant_app/screens/valorant_map.dart';
import 'package:valorant_app/widgets/custom_app_bar.dart';
import 'package:valorant_app/widgets/custom_drawer.dart';
import 'package:valorant_app/widgets/map_card.dart';
import 'dart:convert';

class MapData {
  final String displayName;
  final String splash;

  MapData({required this.displayName, required this.splash});
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<MapData> mapData = [];

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

    _animation = Tween<double>(begin: 0.2, end: 1.0).animate(curvedAnimation);

    fetchData();

    _animationController.forward();
  }

  Future<void> fetchData() async {
    const url = 'https://valorant-api.com/v1/maps';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final maps = data['data'];
      maps.removeAt(11);

      setState(() {
        mapData = maps
            .map<MapData>((map) => MapData(
                  displayName: map['displayName'],
                  splash: map['splash'],
                ))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    if (!mounted) _animationController.dispose();
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
                  'VALORANT MAPS',
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
                    crossAxisCount: 2,
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
                              builder: (context) =>
                                  ValorantMap(mapName: map.displayName),
                            ));
                      },
                      child: MapCard(
                        imagePath: map.splash,
                        text: map.displayName,
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

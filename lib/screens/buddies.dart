import 'package:flutter/material.dart';
import 'package:valorant_app/screens/homepage.dart';
import 'package:valorant_app/widgets/custom_app_bar.dart';
import 'package:valorant_app/widgets/custom_drawer.dart';
import 'package:valorant_app/widgets/glass_card.dart';
import 'package:valorant_app/widgets/logo_widget.dart';
import '../widgets/constant.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

int currentIndex = 0;

class BuddyData {
  final String displayName;
  final String displayIcon;

  BuddyData({required this.displayName, required this.displayIcon});
}

class BuddiesScreen extends StatefulWidget {
  const BuddiesScreen({super.key});

  @override
  State<BuddiesScreen> createState() => _BuddiesScreenState();
}

class _BuddiesScreenState extends State<BuddiesScreen> {
  List<BuddyData> buddiesData = [];
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const url =
        'https://valorant-api.com/v1/buddies'; // Replace with your API endpoint
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final buddies = data['data'];

      setState(() {
        buddiesData = buddies
            .map<BuddyData>((buddy) => BuddyData(
                  displayName: buddy['displayName'],
                  displayIcon: buddy['displayIcon'],
                ))
            .toList();
      });
    }
  }

  void goToPrevious() {
    carouselController.previousPage();
  }

  void goToNext() {
    carouselController.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundcolor,
      appBar: const CustomAppBar(),
      drawer: const CustomAppDrawer(),
      body: Column(
        children: [
          const Text(
            'Valorant Buddies',
            style: TextStyle(fontSize: 35),
          ),
          const Center(
            child: LogoWidget(),
          ),
          Expanded(
            child: buddiesData.isNotEmpty
                ? CarouselSlider.builder(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 400.0,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                    itemCount: buddiesData.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final buddy = buddiesData[index];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              buddy.displayName,
                              style: const TextStyle(
                                color: kMenucolor,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            GlassnewsCard(
                              imagePath: buddy.displayIcon,
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20,
                ),
                color: Colors.white,
                onPressed: goToPrevious,
              ),
              Text(
                '${currentIndex + 1}/${buddiesData.length}',
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
              IconButton(
                color: Colors.white,
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 20,
                ),
                onPressed: goToNext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:valorant_app/screens/homepage.dart';
import 'package:valorant_app/widgets/cardff.dart';
import 'package:valorant_app/widgets/custom_app_bar.dart';
import 'package:valorant_app/widgets/custom_drawer.dart';
import '../widgets/constant.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

int currentIndex = 0;

class CardData {
  final String displayName;
  final String fullTransparentIcon;

  CardData({required this.displayName, required this.fullTransparentIcon});
}

class SprayScreen extends StatefulWidget {
  const SprayScreen({super.key});

  @override
  State<SprayScreen> createState() => _SprayScreenState();
}

class _SprayScreenState extends State<SprayScreen> {
  List<CardData> sprayData = [];
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const url = 'https://valorant-api.com/v1/sprays';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final sprays = data['data'];

      setState(() {
        sprayData = sprays
            .map<CardData>((spraycard) => CardData(
                  displayName: spraycard['displayName'],
                  fullTransparentIcon: spraycard['fullTransparentIcon'] ??
                      spraycard['displayIcon'],
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
            'Valorant sprays',
            style: TextStyle(fontSize: 25),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homepage(),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/valorantlogo.png',
                height: 200,
                width: 200,
              ),
            ),
          ),
          sprayData.isNotEmpty
              ? CarouselSlider.builder(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    height: 455,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: false,
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
                  itemCount: sprayData.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    final spraycard = sprayData[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            spraycard.displayName,
                            style: const TextStyle(
                              color: kMenucolor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Expanded(
                            child: Cardff(
                              imagePath: spraycard.fullTransparentIcon,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          const Spacer(),
          buildBottom(currentIndex, sprayData.length),
        ],
      ),
    );
  }

  SizedBox buildBottom(int currentIndex, int maxLength) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
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
            '${currentIndex + 1}/$maxLength',
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
    );
  }
}

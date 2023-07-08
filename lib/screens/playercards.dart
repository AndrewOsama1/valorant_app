import 'package:flutter/material.dart';
import 'package:valorant_app/screens/homepage.dart';
import 'package:valorant_app/widgets/cardff.dart';
import 'package:valorant_app/widgets/custom_app_bar.dart';
import 'package:valorant_app/widgets/custom_drawer.dart';
import 'package:valorant_app/widgets/logo_widget.dart';
import '../widgets/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

int currentIndex = 0;

class CardData {
  final String displayName;
  final String largeArt;

  CardData({required this.displayName, required this.largeArt});
}

class PlayerCardsScreen extends StatefulWidget {
  const PlayerCardsScreen({super.key});

  @override
  State<PlayerCardsScreen> createState() => PlayerCardsState();
}

class PlayerCardsState extends State<PlayerCardsScreen> {
  List<CardData> playerData = [];
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const url =
        'https://valorant-api.com/v1/playercards';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final cardss = data['data'];

      setState(() {
        playerData = cardss
            .map<CardData>((playercard) => CardData(
                  displayName: playercard['displayName'],
                  largeArt: playercard['largeArt'],
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
            'Valorant player cards',
            style: TextStyle(fontSize: 25),
          ),
          const Center(
            child: LogoWidget(),
          ),
          playerData.isNotEmpty
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
                  itemCount: playerData.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    final playercard = playerData[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            playercard.displayName,
                            style: const TextStyle(
                              color: kMenucolor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Expanded(
                            child: Cardff(
                              imagePath: playercard.largeArt,
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
          buildBottom(currentIndex, playerData.length),
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

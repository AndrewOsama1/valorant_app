import 'package:flutter/material.dart';
import 'package:valorant_app/widgets/constant.dart';
import 'package:valorant_app/widgets/chip.dart';
import 'package:valorant_app/widgets/custom_app_bar.dart';
import 'package:valorant_app/widgets/custom_drawer.dart';

class Lineup extends StatefulWidget {
  const Lineup({super.key});

  @override
  LineupState createState() => LineupState();
}

class LineupState extends State<Lineup> {
  bool showContainer1 = false;
  bool showContainer2 = false;
  bool showContainer3 = false;
  bool showContainer4 = false;
  bool showContainer5 = false;
  bool showContainer6 = false;
  bool showContainer7 = false;
  bool showContainer8 = false;
  bool showContainer9 = false;

  // Add more boolean variables for each container

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomAppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    iconSize: 40,
                    onPressed: () {
                      Navigator.pop(
                          context); // Navigate back to the previous page
                    },
                  ),
                  const Text(
                    'Agents',
                    style: TextStyle(
                      fontSize: 45,
                      color: kMenucolor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                      width: 40), // Add spacing between the button and text
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildChip(
                    label: 'Sage',
                    image: 'assets/images/sage.png',
                    onPressed: () {
                      setState(() {
                        showContainer1 = !showContainer1;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  buildChip(
                    label: 'Yoru',
                    image: 'assets/images/yoru.png',
                    onPressed: () {
                      setState(() {
                        showContainer2 = !showContainer2;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  buildChip(
                    label: 'Brimstone',
                    image: 'assets/images/brimstone.png',
                    onPressed: () {
                      setState(() {
                        showContainer3 = !showContainer3;
                      });
                    },
                  ),
                  // Add more individual chips here...
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildChip(
                    label: 'Viper',
                    image: 'assets/images/viper.png',
                    onPressed: () {
                      setState(() {
                        showContainer4 = !showContainer4;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  buildChip(
                    label: 'Killjoy',
                    image: 'assets/images/killjoy.png',
                    onPressed: () {
                      setState(() {
                        showContainer5 = !showContainer5;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  buildChip(
                    label: 'Sova',
                    image: 'assets/images/sova.png',
                    onPressed: () {
                      setState(() {
                        showContainer6 = !showContainer6;
                      });
                    },
                  ),
                  // Add more individual chips here...
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildChip(
                    label: 'Cypher',
                    image: 'assets/images/cypher.png',
                    onPressed: () {
                      setState(() {
                        showContainer7 = !showContainer7;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  buildChip(
                    label: 'Kayo',
                    image: 'assets/images/kayo.png',
                    onPressed: () {
                      setState(() {
                        showContainer8 = !showContainer8;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  buildChip(
                    label: 'Fade',
                    image: 'assets/images/fade.png',
                    onPressed: () {
                      setState(() {
                        showContainer9 = !showContainer9;
                      });
                    },
                  ),
                  // Add more individual chips here...
                ],
              ),

              Visibility(
                visible: showContainer1,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Sage in Haven',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Yoru Teleports from C to Their base',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/yoru.gif'),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: showContainer2,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Yoru in Haven',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Yoru Teleports from C to Their base',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/yoru.gif'),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: showContainer3,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Brimstone in Haven',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Yoru Teleports from C to Their base',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/yoru.gif'),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: showContainer4,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Viper in Haven',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Viper Teleports from C to Their base',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/yoru.gif'),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: showContainer5,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'killjoy in Haven',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Yoru Teleports from C to Their base',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/yoru.gif'),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: showContainer6,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Sova in Haven',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Yoru Teleports from C to Their base',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/yoru.gif'),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: showContainer7,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Cypher in Haven',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Cypher Teleports from C to Their base',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/yoru.gif'),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: showContainer8,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Kayo in Haven',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Yoru Teleports from C to Their base',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/yoru.gif'),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: showContainer9,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Fade in Haven',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Yoru Teleports from C to Their base',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/yoru.gif'),
                    ],
                  ),
                ),
              ),

              // Add more containers...
            ],
          ),
        ),
      ),
    );
  }
}

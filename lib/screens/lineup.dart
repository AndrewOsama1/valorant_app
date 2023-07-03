import 'package:flutter/material.dart';
import 'package:valorant_app/widgets/constant.dart';
import 'package:valorant_app/widgets/chip.dart';
import 'package:valorant_app/widgets/custom_app_bar.dart';
import 'package:valorant_app/widgets/custom_drawer.dart';
import 'package:video_player/video_player.dart';

class Lineup extends StatefulWidget {
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
  bool isPlaying = false;

  List<String> videoPaths = [
    'assets/videos/sage.mp4',
    'assets/videos/yoru.mp4',
    'assets/videos/brim.mp4',
    'assets/videos/viper.mp4',
    'assets/videos/killjoy.mp4',
    'assets/videos/sova.mp4',
    'assets/videos/cypher.mp4',
    'assets/videos/kayo.mp4',
    'assets/videos/fade.mp4',

    // Add more video paths here
  ];
  List<VideoPlayerController> videoControllers = [];
  List<bool> isVideoInitialized = [];

  @override
  void initState() {
    super.initState();
    for (String path in videoPaths) {
      final controller = VideoPlayerController.asset(path);
      videoControllers.add(controller);
      isVideoInitialized.add(false);
      controller.initialize().then((_) {
        setState(() {
          isVideoInitialized[videoControllers.indexOf(controller)] = true;
        });
      }).catchError((error) {});
    }
  }

  @override
  void dispose() {
    for (VideoPlayerController controller in videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget buildVideoPlayer(int index) {
    final controller = videoControllers[index];
    if (isVideoInitialized[index]) {
      return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: VideoPlayer(controller)),
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  if (isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                  isPlaying = !isPlaying;
                });
              },
            ),
          ],
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }

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
                  const SizedBox(width: 40),
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
                ],
              ),

              // Repeat the same pattern for other rows of chips

              Visibility(
                visible: showContainer1,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Sage in Pearl',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Grimwall Sage in A site ',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      isVideoInitialized[0]
                          ? buildVideoPlayer(0)
                          : const CircularProgressIndicator(),
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
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      isVideoInitialized[1]
                          ? buildVideoPlayer(1)
                          : const CircularProgressIndicator(),
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
                        'Brimstone in Bind',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Brimstone Lineup on B ',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      isVideoInitialized[2]
                          ? buildVideoPlayer(2)
                          : const CircularProgressIndicator(),
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
                        'Viper in A',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Viper Lineup on A ',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      isVideoInitialized[3]
                          ? buildVideoPlayer(3)
                          : const CircularProgressIndicator(),
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
                        'Killjoy in Fracture',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'KillJoy Setup A ',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      isVideoInitialized[4]
                          ? buildVideoPlayer(4)
                          : const CircularProgressIndicator(),
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
                        'Sova in Lotus',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Sova Reveal on A ',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      isVideoInitialized[5]
                          ? buildVideoPlayer(5)
                          : const CircularProgressIndicator(),
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
                        'Cypher in Breeze',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Cypher Setup on A ',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      isVideoInitialized[6]
                          ? buildVideoPlayer(6)
                          : const CircularProgressIndicator(),
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
                        'Kayo in Split',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Kayo Oneway flash A ',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      isVideoInitialized[7]
                          ? buildVideoPlayer(7)
                          : const CircularProgressIndicator(),
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
                        'Fade in Icebox',
                        style: TextStyle(fontSize: 40, color: kMenucolor),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Fade Reveal on A ',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      isVideoInitialized[8]
                          ? buildVideoPlayer(8)
                          : const CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),

              // Repeat the same pattern for other videos
            ],
          ),
        ),
      ),
    );
  }
}

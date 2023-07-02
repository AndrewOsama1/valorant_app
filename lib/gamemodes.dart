import 'package:flutter/material.dart';
import 'package:valorant_app/widgets/custom_app_bar.dart';
import 'package:valorant_app/widgets/custom_drawer.dart';
import 'constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapData {
  final String displayName;
  final String displayIcon;
  final String? duration;

  MapData(
      {required this.displayName, required this.displayIcon, this.duration});
}

class Gamemodescreen extends StatefulWidget {
  const Gamemodescreen({super.key});

  @override
  GamemodescreenState createState() => GamemodescreenState();
}

class GamemodescreenState extends State<Gamemodescreen>
    with SingleTickerProviderStateMixin {
  List<MapData> mapData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const url =
        'https://valorant-api.com/v1/gamemodes'; // Replace with your API endpoint
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final maps = data['data'];

      setState(() {
        mapData = maps
            .map<MapData>((map) => MapData(
                displayName: map['displayName'],
                displayIcon: map['displayIcon'] ?? '',
                duration: map['duration']))
            .toList();
      });
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
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: kMenucolor,
                          ),
                          iconSize: 40,
                          onPressed: () {
                            Navigator.pop(
                                context); // Navigate back to the previous page
                          },
                        ),
                        const Text(
                          'GameModes',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Valorant',
                            color: kMenucolor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                            width:
                                40), // Add spacing between the button and text
                      ],
                    ),
                  ),
                ),
              ),
              if (mapData.isNotEmpty)
                Image.network(
                  mapData[0].displayIcon,
                  height: 200.0,
                  width: 200.0,
                ),
              const SizedBox(height: 20),
              if (mapData.isNotEmpty)
                Text(
                  mapData[0].displayName,
                  style: const TextStyle(fontSize: 50),
                ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, color: kMenucolor),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'In the standard non-ranked mode, the match is played as best of 25 - the first team to win 13 rounds wins the match. The attacking team has a bomb-type device called the Spike. They must deliver and activate the Spike on one of the multiple specified locations (bomb sites).',
                ),
              ),
              if (mapData.isNotEmpty)
                Image.network(
                  mapData[1].displayIcon,
                  height: 200.0,
                  width: 200.0,
                ),
              const SizedBox(height: 20),
              if (mapData.isNotEmpty)
                Text(
                  mapData[1].displayName,
                  style: const TextStyle(fontSize: 50),
                ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, color: kMenucolor),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'You play in one of the teams, get kills, respawn endlessly, and the first team to reach the objective wins'),
              ),
              if (mapData.isNotEmpty)
                Image.network(
                  mapData[2].displayIcon,
                  height: 200.0,
                  width: 200.0,
                ),
              const SizedBox(height: 20),
              if (mapData.isNotEmpty)
                Text(
                  mapData[2].displayName,
                  style: const TextStyle(fontSize: 50),
                ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, color: kMenucolor),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'Escalation is a TDM game mode in VALORANT where players cycle through different weapons and abilities.'),
              ),
              if (mapData.isNotEmpty)
                Image.network(
                  mapData[3].displayIcon,
                  height: 200.0,
                  width: 200.0,
                ),
              const SizedBox(height: 20),
              if (mapData.isNotEmpty)
                Text(
                  mapData[3].displayName,
                  style: const TextStyle(fontSize: 35),
                ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, color: kMenucolor),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'As the name suggests, players will be divided into two teams of five, and thrown into frenetic gun battles to rack up 100 kills, across three new maps'),
              ),
              if (mapData.isNotEmpty)
                Image.network(
                  mapData[5].displayIcon,
                  height: 200.0,
                  width: 200.0,
                ),
              const SizedBox(height: 20),
              if (mapData.isNotEmpty)
                Text(
                  mapData[5].displayName,
                  style: const TextStyle(fontSize: 50),
                ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, color: kMenucolor),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'Replication is a casual game mode where everyone on a team plays as the same agent. There are 4 rounds in a half, first to 5 wins, and overtime is one round. Each new round refreshes your abilities and resets your weapons and shields.'),
              ),
              if (mapData.isNotEmpty)
                Image.network(
                  mapData[6].displayIcon,
                  height: 200.0,
                  width: 200.0,
                ),
              const SizedBox(height: 20),
              if (mapData.isNotEmpty)
                Text(
                  mapData[6].displayName,
                  style: const TextStyle(fontSize: 50),
                ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, color: kMenucolor),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'In Spike Rush two teams of five players will play against each other, much like the standard matches. Teams are split into an offensive and a defensive side with all players on the offensive team receiving a Spike. Ultimately the game is won by planting and detonating the spike or by killing all players on the opposing team. The first team to win four rounds wins the game.'),
              ),
              if (mapData.isNotEmpty)
                Image.network(
                  mapData[8].displayIcon,
                  height: 200.0,
                  width: 200.0,
                ),
              const SizedBox(height: 20),
              if (mapData.isNotEmpty)
                Text(
                  mapData[8].displayName,
                  style: const TextStyle(fontSize: 35),
                ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, color: kMenucolor),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'Snowball Fight is a 5v5 team death-match-style mode where the first team to 50 kills wins. All players load into game with an agent of their choice and only have access to a Snowball Launcher. This weapon fires projectile-based snowballs that have a travel time and an arc.'),
              ),
              if (mapData.isNotEmpty)
                Image.network(
                  mapData[9].displayIcon,
                  height: 200.0,
                  width: 200.0,
                ),
              const SizedBox(height: 20),
              if (mapData.isNotEmpty)
                Text(
                  mapData[9].displayName,
                  style: const TextStyle(fontSize: 40),
                ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, color: kMenucolor),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'The Swift-play game mode in VALORANT is a best-of-nine-round game. In this, each team will consist of five players. Similar to the format and economy of a normal unrated game, the match will end when the first team reaches five rounds. As such, this game mode could be considered a mini-Unrated match'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

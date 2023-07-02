import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buddies.dart';
import '../bundles.dart';
import '../constant.dart';
import '../gamemodes.dart';
import '../homepage.dart';
import '../maps.dart';
import '../playercards.dart';
import '../selectagent.dart';
import '../spray.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kMenucolor,
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: ListView(
          children: [
            ListTile(
              leading: IconButton(
                icon: const Icon(
                  Icons.home,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                  // Handle menu item 1 press
                },
              ),
              title: const Text(
                'HomePage',
                style: TextStyle(color: Colors.white, fontFamily: 'Valorant'),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
                // Handle menu item 1 press
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/img2.png',
                width: 40,
                height: 40,
              ),
              title: const Text(
                'Agents',
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AgentScreen()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/img2.png',
                width: 40,
                height: 40,
              ),
              title: const Text(
                'Players Cards',
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlayerCardsScreen()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/img3.png',
                width: 40,
                height: 40,
              ),
              title: const Text('Buddies'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BuddiesScreen()));
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/img4.png',
                width: 40,
                height: 40,
              ),
              title: const Text('Bundles'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BundleScreen()));
                // Handle menu item 1 press
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/img5.png',
                width: 40,
                height: 40,
              ),
              title: const Text(
                'Sprays',
                style: TextStyle(color: Colors.white, fontFamily: 'Valorant'),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SprayScreen()));
                // Handle menu item 1 press
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/img9.png',
                width: 40,
                height: 40,
              ),
              title: const Text(
                'Games Modes',
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Gamemodescreen()));
                // Handle menu item 3 press
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/img6.png',
                width: 40,
                height: 40,
              ),
              title: const Text('Maps'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MapScreen()));
                // Handle menu item 3 press
              },
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/img7.png',
                width: 40,
                height: 40,
              ),
              title: const Text('Lineups'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AgentScreen()));
                // Handle menu item 3 press
              },
            ),
          ],
        ),
      ),
    );
  }
}

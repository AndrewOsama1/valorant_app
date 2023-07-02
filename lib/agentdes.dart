import 'package:flutter/material.dart';
import 'package:valorant_app/selectagent.dart';
import 'package:valorant_app/widgets/custom_app_bar.dart';
import 'package:valorant_app/widgets/custom_drawer.dart';
import 'constant.dart';

class YourAgent extends StatefulWidget {
  final AgentData agentData;
  const YourAgent({super.key, required this.agentData});

  @override
  State<YourAgent> createState() => _YourAgentState();
}

class _YourAgentState extends State<YourAgent> {
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
                        Text(
                          widget.agentData.displayName,
                          style: const TextStyle(
                            fontSize: 30.0,
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
              const SizedBox(height: 50),
              Stack(
                children: [
                  Image.network(widget.agentData.background),
                  Transform.scale(
                    scale: 1.7,
                    child: Image.network(
                      widget.agentData.fullPortrait,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Role',
                style: TextStyle(fontSize: 80, color: kMenucolor),
              ),
              const SizedBox(height: 30),
              Image.network(widget.agentData.roleIcon),
              const SizedBox(height: 50),
              const Text(
                'Abilities',
                style: TextStyle(fontSize: 70, color: kMenucolor),
              ),
              Image.network(widget.agentData.iconOne),
              const SizedBox(height: 30),
              Text(
                widget.agentData.abilityOne,
                style: const TextStyle(fontSize: 35, color: kMenucolor),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(widget.agentData.desOne),
              ),
              Image.network(widget.agentData.iconTwo),
              const SizedBox(height: 30),
              Text(
                widget.agentData.abilityTwo,
                style: const TextStyle(fontSize: 35, color: kMenucolor),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(widget.agentData.desTwo),
              ),
              Image.network(widget.agentData.iconThree),
              const SizedBox(height: 30),
              Text(
                widget.agentData.abilityThree,
                style: const TextStyle(fontSize: 35, color: kMenucolor),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(widget.agentData.desThree),
              ),
              Image.network(widget.agentData.iconFour),
              const SizedBox(height: 30),
              Text(
                widget.agentData.abilityFour,
                style: const TextStyle(fontSize: 35, color: kMenucolor),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(widget.agentData.desFour),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

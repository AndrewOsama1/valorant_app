import 'package:flutter/material.dart';

import 'package:valorant_app/constant.dart';
import 'package:valorant_app/widgets/custom_app_bar.dart';
import 'package:valorant_app/widgets/custom_drawer.dart';
import 'package:valorant_app/widgets/painter.dart';

class ValorantMap extends StatefulWidget {
  final String mapName;

  const ValorantMap({super.key, required this.mapName});

  @override
  ValorantMapState createState() => ValorantMapState();
}

class ValorantMapState extends State<ValorantMap> {
  final GlobalKey _imageKey = GlobalKey();
  List<List<Offset>> lines = [];
  List<Offset>? currentLine;
  bool isPaintingEnabled = false;
  double scale = 1.0;
  final TransformationController _transformationController =
      TransformationController();

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
              Align(
                alignment: Alignment.topCenter,
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
                      widget.mapName,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Valorant',
                        color: kMenucolor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                        width: 40), // Add spacing between the button and text
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 4,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      key: _imageKey,
                      width: 500,
                      height: 350,
                      child: ClipRRect(
                        child: Stack(
                          children: [
                            InteractiveViewer(
                              minScale: 0.1,
                              maxScale: 2,
                              transformationController:
                                  _transformationController,
                              onInteractionEnd: (details) {
                                scale = _transformationController.value
                                    .getMaxScaleOnAxis();
                                setState(() {});
                              },
                              child: Image.asset(
                                  'assets/images/${widget.mapName.toLowerCase()}.png'),
                            ),
                            if (isPaintingEnabled)
                              GestureDetector(
                                onPanDown: (details) {
                                  final RenderBox renderBox = _imageKey
                                      .currentContext
                                      ?.findRenderObject() as RenderBox;
                                  final localPosition = renderBox
                                      .globalToLocal(details.globalPosition);
                                  setState(() {
                                    currentLine = [localPosition];
                                    lines.add(currentLine!);
                                  });
                                },
                                onPanUpdate: (details) {
                                  final RenderBox renderBox = _imageKey
                                      .currentContext
                                      ?.findRenderObject() as RenderBox;
                                  final localPosition = renderBox
                                      .globalToLocal(details.globalPosition);
                                  setState(() {
                                    currentLine?.add(localPosition);
                                  });
                                },
                                onPanEnd: (_) {
                                  currentLine = null;
                                },
                                child: CustomPaint(
                                  painter: DrawingPainter(
                                      lines, Size(500 * scale, 250 * scale)),
                                  size: Size(500 * scale, 250 * scale),
                                ),
                              ),
                            if (!isPaintingEnabled)
                              IgnorePointer(
                                child: CustomPaint(
                                  painter: DrawingPainter(
                                      lines, Size(500 * scale, 250 * scale)),
                                  size: Size(500 * scale, 250 * scale),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'paint',
                backgroundColor: kMenucolor,
                onPressed: () {
                  setState(() {
                    isPaintingEnabled = !isPaintingEnabled;
                  });
                },
                child: Icon(
                  isPaintingEnabled ? Icons.brush : Icons.brush_outlined,
                ),
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                heroTag: 'delete',
                backgroundColor: kMenucolor,
                onPressed: () {
                  setState(() {
                    lines.clear();
                  });
                },
                child: const Icon(
                  Icons.delete,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

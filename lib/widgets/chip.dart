import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

Widget buildChip({
  required String label,
  required String image,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Chip(
        backgroundColor: kMenucolor,
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        avatar: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 110,
          backgroundImage: AssetImage(image),
        )),
  );
}

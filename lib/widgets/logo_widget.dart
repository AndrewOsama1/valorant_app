import 'package:flutter/material.dart';

import '../screens/homepage.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Homepage()));
      },
      child: Image.asset(
        'assets/images/valorantlogo.png',
        height: 110,
        width: 110,
      ),
    );
  }
}

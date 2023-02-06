import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xo_game/home_page.dart';
import 'package:xo_game/styles.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorful.color1,
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 200),
          SvgPicture.asset('assets/Vector1.svg'),
          SizedBox(height: 100),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                'Play',
                style: Texts.style1,
              ))
        ],
      )),
    );
  }
}

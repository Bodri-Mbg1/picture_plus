import 'package:flutter/material.dart';
import 'package:picture_plus/widgets/button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset(
                'assets/img/img2.png',

                width: MediaQuery.of(context)
                    .size
                    .width, // Largeur de l'image égale à la largeur de l'écran
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 380),
              child: Image.asset(
                'assets/img/img1.png',

                width: MediaQuery.of(context)
                    .size
                    .width, // Largeur de l'image égale à la largeur de l'écran
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to\nPICTUREPLUS',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'FontsFree',
                      letterSpacing: -2.0,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing\nand typesetting industry.\nLorem Ipsum has been the industry's standard dummy text\never since the 1500s, when an unknown printer\ntook a galley of type and scrambled it to make a\ntype specimen book",
                    style:
                        TextStyle(fontSize: 10, height: 1, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Button1(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

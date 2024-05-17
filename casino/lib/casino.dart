
import 'dart:math';

import 'package:flutter/material.dart';

class Casino extends StatefulWidget {
  const Casino({super.key});

  @override 
  State<Casino> createState() => _CasinoState();
}

class _CasinoState extends State<Casino> {
  var randomImage1 = 0;
  var randomImage2 = 0;
  var randomImage3 = 0;
  var isWon = false;
  var textPlay = "";
  var images = ["images/bar.png", "images/cerise.png", "images/cloche.png", "images/diamant.png", "images/fer-a-cheval.png", "images/pasteque.png", "images/sept.png"];

  void play() {
    setState(() {
      randomImage1 = Random().nextInt(7);
      randomImage2 = Random().nextInt(7);
      randomImage3 = Random().nextInt(7);
      randomImage1 == randomImage2 && randomImage2 == randomImage3 ? isWon = true : isWon = false;
      isWon ? (randomImage1 == 6 ? textPlay = "Super jackpot !" : textPlay = "Jackpot !") : textPlay = "You lost, try again !";
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: isWon ? Colors.yellow : Colors.white,
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      backgroundColor: Colors.deepPurple,
        title: const Text(
          'Casino',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.white,
            ),
        ),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0), 
              child: Image.asset(
                images[randomImage1],
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0), 
              child: Image.asset(
                images[randomImage2],
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0), 
              child: Image.asset(
                images[randomImage3],
                width: 100,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0), 
          child: ElevatedButton(
            onPressed: play,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
            ),
            child: const Text(
              'Jouer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0), 
          child: Text(
              textPlay,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: textPlay == "Super jackpot !" ? 40 : 20,
                color: isWon ? Colors.deepPurple : Colors.black,
              )
            ),
        ),
      ],
    ),
    );
  }
}
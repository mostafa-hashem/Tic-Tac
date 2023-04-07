import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xogame/player_model.dart';
import 'game_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";
  var playerOneController = TextEditingController();
  var playerTwoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Fill your Names",
            style: GoogleFonts.aladin(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child:  TextField(
              controller: playerOneController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Player One Name',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.redAccent
                    )
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent
                  )
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child:  TextField(
              controller: playerTwoController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Player Two Name',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.redAccent
                    )
                ),
                enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
              color: Colors.blueAccent
              )
            ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.blue),
              child: TextButton(
                onPressed: () {
                  playerModels p = playerModels(playerOneController.text, playerTwoController.text);
                  Navigator.pushNamed(context, GameScreen.routeName, arguments: p);
                },
                child: Text(
                  "Let's Play Now",
                  style: GoogleFonts.aladin(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                ),
              ))
        ],
      ),
    );
  }
}

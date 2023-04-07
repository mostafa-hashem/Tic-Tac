import 'package:flutter/material.dart';
import 'package:xogame/board_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xogame/login_screen.dart';
import 'package:xogame/player_model.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = "GameScreen";

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> boardState = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  int player1Score = 0;
  int player2Score = 0;
  bool winnerX = false;
  bool winnerO = false;
  int cnt = 0;
  String? symbol;

  @override
  Widget build(BuildContext context) {
    var arguments=ModalRoute.of(context)?.settings.arguments as playerModels;
    return  Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 97, 79),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        arguments.playerOne,
                        style: GoogleFonts.coiny(
                          textStyle:
                              const TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                      Text(
                        "$player1Score",
                        style: GoogleFonts.coiny(
                          textStyle:
                              const TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        arguments.playerTwo,
                        style: GoogleFonts.coiny(
                          textStyle:
                              const TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                      Text(
                        "$player2Score",
                        style: GoogleFonts.coiny(
                          textStyle:
                              const TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoardState(boardState[0], onBtnClicked, 0),
                  BoardState(boardState[1], onBtnClicked, 1),
                  BoardState(boardState[2], onBtnClicked, 2),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoardState(boardState[3], onBtnClicked, 3),
                  BoardState(boardState[4], onBtnClicked, 4),
                  BoardState(boardState[5], onBtnClicked, 5),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoardState(boardState[6], onBtnClicked, 6),
                  BoardState(boardState[7], onBtnClicked, 7),
                  BoardState(boardState[8], onBtnClicked, 8),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                  onPressed: () {
                    reset();
                    setState(() {});
                  },
                  child: Text(
                    "Reset",
                    style: GoogleFonts.aladin(
                      textStyle: const TextStyle(color: Colors.black, fontSize: 40),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  void onBtnClicked(index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (cnt % 2 == 0) {
      boardState[index] = "X";
      player1Score += 2;
      winnerX = checkWinner("X");
      if (winnerX) {
        player1Score += 8;
        return;
      }
    } else {
      boardState[index] = "O";
      player2Score += 2;
      bool winnerO = checkWinner("O");
      if (winnerO) {
        player2Score += 8;
        return;
      }
    }
    cnt++;
    if (cnt == 9) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Draw!'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Choose what you want'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Play again'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    reset();
                  },
                ),
                TextButton(
                  child: const Text('Restart'),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, LoginScreen.routeName);
                    setState(() {});
                  },
                ),
              ],
            );
          },
        );
    }
    checkWinner(symbol);
    setState(() {});
  }

  bool checkWinner(symbol) {
    if (winnerX || winnerO) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Congratulation,$symbol you Won!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Choose what you want!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Play again'),
                onPressed: () {
                  Navigator.of(context).pop();
                  playAgain();
                },
              ),
              TextButton(
                child: const Text('Restart'),
                onPressed: () {
                  Navigator.popAndPushNamed(context, LoginScreen.routeName);
                  setState(() {});
                },
              ),
            ],
          );
        },
      );
    }
    // Check Row
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    // Check Column
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    // Check Diagonals
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void reset() {
    boardState = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    player1Score = 0;
    player2Score = 0;
    cnt = 0;
    setState(() {});
  }
  void playAgain() {
    boardState = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    cnt = 0;
    setState(() {});
  }
}

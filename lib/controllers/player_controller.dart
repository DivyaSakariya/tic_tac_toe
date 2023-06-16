import 'package:flutter/material.dart';

class PlayerController extends ChangeNotifier {
  bool turnO = true;
  int scoreX = 0;
  int scoreO = 0;
  List<String> displayValue = ['', '', '', '', '', '', '', '', ''];
  int filledBoxes = 0;
  String playerTurn = 'O';

  tappedBox({required int index, required BuildContext context}) {
    if (turnO && displayValue[index] == '') {
      displayValue[index] = "O";
      filledBoxes++;
      playerTurn = "X";
    } else if (!turnO && displayValue[index] == '') {
      displayValue[index] = "X";
      filledBoxes++;
      playerTurn = "O";
    }

    // if (turnO) {
    //   playerTurn = "O";
    // } else if (!turnO) {
    //   playerTurn = "X";
    // }

    turnO = !turnO;
    _checkWinner(context);
    notifyListeners();
  }

  void _checkWinner(BuildContext context) {
    if (displayValue[0] == displayValue[1] &&
        displayValue[0] == displayValue[2] &&
        displayValue[0] != '') {
      _showWinDialog(displayValue[0], context);
    }
    if (displayValue[3] == displayValue[4] &&
        displayValue[3] == displayValue[5] &&
        displayValue[3] != '') {
      _showWinDialog(displayValue[3], context);
    }
    if (displayValue[6] == displayValue[7] &&
        displayValue[6] == displayValue[8] &&
        displayValue[6] != '') {
      _showWinDialog(displayValue[6], context);
    }
    if (displayValue[0] == displayValue[3] &&
        displayValue[0] == displayValue[6] &&
        displayValue[0] != '') {
      _showWinDialog(displayValue[0], context);
    }
    if (displayValue[1] == displayValue[4] &&
        displayValue[1] == displayValue[7] &&
        displayValue[1] != '') {
      _showWinDialog(displayValue[1], context);
    }
    if (displayValue[2] == displayValue[5] &&
        displayValue[2] == displayValue[8] &&
        displayValue[2] != '') {
      _showWinDialog(displayValue[2], context);
    }
    if (displayValue[0] == displayValue[4] &&
        displayValue[0] == displayValue[8] &&
        displayValue[0] != '') {
      _showWinDialog(displayValue[0], context);
    }
    if (displayValue[2] == displayValue[4] &&
        displayValue[2] == displayValue[6] &&
        displayValue[2] != '') {
      _showWinDialog(displayValue[2], context);
    } else if (filledBoxes == 9) {
      _showDrawDialog(context);
    }
  }

  void _showWinDialog(String winner, BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Player $winner is Winner...!!"),
        actions: [
          MaterialButton(
            onPressed: () {
              _clearPlayingBoard();
              Navigator.of(context).pop();
            },
            child: const Text("Play Again"),
          ),
        ],
      ),
    );

    if (winner == "O") {
      scoreO++;
    } else if (winner == "X") {
      scoreX++;
    }

    notifyListeners();
  }

  void _showDrawDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Draw the Game"),
        actions: [
          MaterialButton(
            onPressed: () {
              _clearPlayingBoard();
              Navigator.of(context).pop();
            },
            child: const Text("Play Again"),
          ),
        ],
      ),
    );

    notifyListeners();
  }

  void _clearPlayingBoard() {
    for (int i = 0; i < 9; i++) {
      displayValue[i] = '';
    }

    filledBoxes = 0;
    notifyListeners();
  }

  void clearScoreBoard() {
    scoreX = 0;
    scoreO = 0;
    for (int i = 0; i < 9; i++) {
      displayValue[i] = '';
    }
    filledBoxes = 0;

    notifyListeners();
  }
}

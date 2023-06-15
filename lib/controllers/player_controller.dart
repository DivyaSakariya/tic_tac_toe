import 'package:flutter/material.dart';

class PlayerController extends ChangeNotifier {
  bool turnO = true;
  int scoreX = 0;
  int scoreO = 0;
  List<String> displayValue = ['', '', '', '', '', '', '', '', ''];
  int filledBoxes = 0;

  tappedBox({required int index}) {
    if (turnO && displayValue[index] == '') {
      displayValue[index] = "O";
      filledBoxes++;
    } else if (!turnO && displayValue[index] == '') {
      displayValue[index] = "X";
      filledBoxes++;
    }
    turnO = !turnO;
    notifyListeners();
  }

  checkWinner() {
    if (displayValue[0] == displayValue[1] &&
        displayValue[0] == displayValue[2] &&
        displayValue[0] != '') {}
  }
}

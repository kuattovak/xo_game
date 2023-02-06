import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/styles.dart';

class HomePage extends StatefulWidget {
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> changeXO = ['', '', '', '', '', '', '', '', ''];
  bool isTurn = true;
  int xScore = 0;
  int oScore = 0;
  int count = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 43, 43, 43),
        appBar: AppBar(
          backgroundColor: Colorful.color3,
          title: Text(
            'tic-tac-toe',
            style: Texts.style4,
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(
                  width: 120,
                ),
                Column(children: [
                  Text(
                    'Игрок X',
                    style: Texts.style3,
                  ),
                  Text(
                    xScore.toString(),
                    style: Texts.style3,
                  )
                ]),
                SizedBox(width: 20),
                Column(children: [
                  Text(
                    'Игрок O',
                    style: Texts.style3,
                  ),
                  Text(
                    oScore.toString(),
                    style: Texts.style3,
                  )
                ])
              ],
            ),
            SizedBox(height: 20),
            Expanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: changeXO.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            setXorO(index);
                          },
                          child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 46, 46, 46),
                                    border: Border.all(color: Colors.blueGrey),
                                  ),
                                  child: Center(
                                      child: Text(
                                    changeXO[index],
                                    style: Texts.style2,
                                  )))));
                    })),
          ],
        ));
  }

  void setXorO(int i) {
    if (isTurn && changeXO[i] == '') {
      setState(() {
        changeXO[i] = 'o';

        isTurn = !isTurn;
      });
    } else if (!isTurn && changeXO[i] == '') {
      setState(() {
        changeXO[i] = 'x';

        isTurn = !isTurn;
      });
    }

    count++;

    checkWinner();
  }

  void checkWinner() {
    if (changeXO[0] == changeXO[1] &&
        changeXO[0] == changeXO[2] &&
        changeXO[0] != '') {
      _showDialog(winner: changeXO[0]);
    }

    if (changeXO[3] == changeXO[4] &&
        changeXO[3] == changeXO[5] &&
        changeXO[3] != '') {
      _showDialog(winner: changeXO[3]);
    }

    if (changeXO[6] == changeXO[7] &&
        changeXO[6] == changeXO[8] &&
        changeXO[6] != '') {
      _showDialog(winner: changeXO[6]);
    }

    if (changeXO[0] == changeXO[3] &&
        changeXO[0] == changeXO[6] &&
        changeXO[0] != '') {
      _showDialog(winner: changeXO[0]);
    }

    if (changeXO[1] == changeXO[4] &&
        changeXO[1] == changeXO[7] &&
        changeXO[1] != '') {
      _showDialog(winner: changeXO[1]);
    }

    if (changeXO[2] == changeXO[5] &&
        changeXO[2] == changeXO[8] &&
        changeXO[2] != '') {
      _showDialog(winner: changeXO[2]);
    }

    if (changeXO[0] == changeXO[4] &&
        changeXO[0] == changeXO[8] &&
        changeXO[0] != '') {
      _showDialog(winner: changeXO[0]);
    }

    if (changeXO[2] == changeXO[4] &&
        changeXO[2] == changeXO[6] &&
        changeXO[2] != '') {
      _showDialog(winner: changeXO[2]);
    }

    if (count == 9) {
      _showDialog(winnerExist: false);

      _clearBoard();
    }
  }

  void _showDialog({String winner = '', bool winnerExist = true}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(winnerExist ? 'Победитель: $winner' : 'Нет победителя'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Играть ещё раз!'))
            ],
          );
        });

    count = 0;

    _clearBoard();

    if (winner == 'o') {
      setState(() {
        oScore++;
      });
    } else if (winner == 'x') {
      setState(() {
        xScore++;
      });
    }
  }

  void _clearBoard() {
    for (int i = 0; i < 9; i++) {
      changeXO[i] = '';
    }
    count = 0;
  }
}

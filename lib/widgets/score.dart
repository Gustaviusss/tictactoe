import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  bool oTurn;
  int oScore;
  int xScore;
  @override
  Score(this.oTurn, this.oScore, this.xScore);
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 24),
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(left: 55),
                  child: Center(
                    child: Text(
                      'X',
                      style: TextStyle(color: Colors.white, fontSize: 45),
                    ),
                  ),
                  color: oTurn ? Colors.black : Colors.red,
                ),
                Center(
                    child: Text(
                  '$xScore x $oScore',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                )),
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(right: 55),
                  child: Center(
                    child: Text(
                      'O',
                      style: TextStyle(color: Colors.white, fontSize: 45),
                    ),
                  ),
                  color: oTurn ? Colors.red : Colors.black,
                ),
              ]),
            ]));
  }
}

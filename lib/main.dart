import 'dart:ui';
import 'package:flutter/material.dart';

import './widgets/score.dart';
import './widgets/board.dart';
import './widgets/message.dart';

void main() {
  runApp(TicTacToe());
}

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  String message = '';
  int xScore = 0;
  int oScore = 0;
  bool end = false;
  List<String> label = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void _tapFunc(int index) {
    setState(() {
      if (oTurn && label[index] == '') {
        label[index] = 'o'.toUpperCase();
        oTurn = false;
      } else if (!oTurn && label[index] == '') {
        label[index] = 'x'.toUpperCase();
        oTurn = true;
      }

      _checkWinner();
    });
  }

  void _checkWinner() {
    if (label[0] == label[1] && label[0] == label[2] && label[0] != '') {
      _showWinner();
    }
    if (label[0] == label[3] && label[0] == label[6] && label[0] != '') {
      _showWinner();
    }
    if (label[0] == label[4] && label[0] == label[8] && label[0] != '') {
      _showWinner();
    }
    if (label[1] == label[4] && label[1] == label[7] && label[1] != '') {
      _showWinner();
    }
    if (label[2] == label[5] && label[2] == label[8] && label[2] != '') {
      _showWinner();
    }
    if (label[3] == label[4] && label[3] == label[5] && label[3] != '') {
      _showWinner();
    }
    if (label[6] == label[7] && label[6] == label[8] && label[6] != '') {
      _showWinner();
    }
    if (label[6] == label[4] && label[6] == label[2] && label[6] != '') {
      _showWinner();
    }
  }

  void _showWinner() {
    oTurn ? message = 'X Win!' : message = 'O Win!';
    setState(() {
      oTurn ? oScore += 1 : xScore += 1;
      end = true;
    });
  }

  void _restart() {
    message = '';
    oTurn = true;
    end = false;
    for (int i = 0; i < label.length; i++) {
      setState(() {
        label[i] = '';
      });
    }
  }

  void _reload() {
    xScore = 0;
    oScore = 0;
    message = '';
    end = false;
    oTurn = true;
    for (int i = 0; i < label.length; i++) {
      setState(() {
        label[i] = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TicTacToe'), actions: <Widget>[
          Center(
            child: Text('Full Reload',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          IconButton(
              icon: Icon(Icons.rotate_right_outlined), onPressed: _reload)
        ]),
        backgroundColor: Colors.grey[800],
        body: Builder(builder: (context) {
          return Column(children: <Widget>[
            Score(oTurn, xScore, oScore),
            Message(message),
            Board(_tapFunc, label, end),
          ]);
        }),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Restart',
            onPressed: _restart,
            child: Icon(Icons.rotate_left)));
  }
}

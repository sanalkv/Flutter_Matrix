import 'package:flutter/material.dart';
import 'dart:math';

class Matrix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, //AppBar(title: Center(child: Text(""))),
      body: Matrix1(),
      backgroundColor: Colors.white,
    );
  }
}

class Matrix1 extends StatefulWidget {
  @override
  _Database1State createState() => _Database1State();
}

class _Database1State extends State<Matrix1> {
  final colors = <Color>[Colors.yellow, Colors.red, Colors.blue];
  var match = 0;
  int groupvalue = 1;
  double _height = 120;
  String actor = "";
  int rw = 2;
  int cl = 2;

  List<Color> _colors;

  Random random = Random();

  @override
  void initState() {
    super.initState();
    _colors = List<Color>(rw * cl);
    for (int index = 0; index < rw * cl; index++) {
      _colors[index] = randomColor();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrangeAccent),
            height: 50,
            width: 250,
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Text(
              "MATRIX GAME",
              style: TextStyle(
                  fontFamily: "Times New Roman",
                  fontSize: 24,
                  color: Colors.white),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              activeColor: Colors.green,
              groupValue: groupvalue,
              value: 1,
              onChanged: (e) => difficulty(e),
            ),
            Text("Kids"),
            Radio(
              activeColor: Colors.yellow,
              groupValue: groupvalue,
              value: 2,
              onChanged: (e) => difficulty(e),
            ),
            Text("Adults"),
            Radio(
              activeColor: Colors.red,
              groupValue: groupvalue,
              value: 3,
              onChanged: (e) => difficulty(e),
            ),
            Text("Legends    "),
          ],
        ),
        Container(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Table(
            children: table(),
          ),
        ),
      ],
    );
  }

  List<TableRow> table() {
    final tableRows = <TableRow>[];
    for (int row = 0; row < rw; row++) {
      final rowCells = <Widget>[];
      for (int column = 0; column < cl; column++) {
        final index = (row * cl)+column;
        rowCells.add(MaterialButton(
          //key: ValueKey(index),
          color: _colors[index],
          height: _height,
          onPressed: () => _onTableCellPressed(index),
        ));
      }
      tableRows.add(TableRow(children: rowCells));
    }
    return tableRows;
  }

  void _onTableCellPressed(int index) {
    setState(() => _colors[index] = randomColor(index));
    checkColorMatches();
  }

  Color randomColor([int index]){
   // Color current = index != null ? _colors[index] : null;
    Color chosen;
   // do {
      chosen = colors[random.nextInt(colors.length)];
   // } while(current != chosen);
    return chosen;
  }

  void checkColorMatches() {
    final first = _colors.first;
    if (_colors.every((color) => color == first)) {
      print("color matches");
      SnackBar snackBar = new SnackBar(
        content: Text("matches"),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    } else {
      print("no match");
    }
  }

  difficulty(e) {
    setState(() {
      if (e == 1) {
        groupvalue = 1;
        _height = 120;
        rw = 2;
        cl = 2;
      } else if (e == 2) {
        groupvalue = 2;
        _height = (120 / 1.5);
        rw = 3;
        cl = 3;
      } else if (e == 3) {
        groupvalue = 3;
        _height = (120 / 2);
        rw = 4;
        cl = 4;
      }
    });
  }
}

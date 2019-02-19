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
  List color = [Colors.yellow, Colors.red, Colors.blue];
  List<Widget> buttons = [];
  List<TableRow> tablerow = [];
  var match = 0;
  int groupvalue = 1;
  double _height = 120;
  String actor = "";
  int rw = 2;
  int cl = 2;
  int e = 1;
  Color _color;

  Random num = Random();

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
              child: Text("MATRIX GAME",
                  style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 24,
                      color: Colors.white))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                activeColor: Colors.green,
                groupValue: groupvalue,
                value: 1,
                onChanged: (e) => difficulty(e)),
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
            Text("Legends    ")
          ],
        ),
        Container(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Table(children: table()),
        ),
      ],
    );
  }

  List<TableRow> table() {
    tablerow = [];

    for (int rows = 1; rows <= rw; rows++) {
      for (int columns = 1; columns <= cl; columns++) {
        _color = randomColor();
        buttons.add(MaterialButton(
          color: _color,
          height: _height,
          onPressed: () {
            setState(() {});
          },
        ));
      }
      tablerow.add(TableRow(children: buttons));
      buttons = [];
    }

    colorState();

    return tablerow;
  }

  check() {
    if (match == 1) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text("hello"),
            );
          });
    }
  }

  Color randomColor() {
    return color[num.nextInt(3)];
  }

  colorState() {
    List<Color> colors = [];
    tablerow.forEach((rows) {
      //print(rows);
      var rowbtns = rows.children;
      print(rowbtns);
      rowbtns.forEach((button) {
        MaterialButton mb = button;

        colors.add(mb.color);
      });
    });
    print(colors);
    if (colors[0] == colors[1]) {
      print(colors.length);
    }
    int i;
    int result = 1;
    for (i = 0; i < colors.length; i++) {
      int val = colors[i].value;
      if (result == 0) {
        break;
      }
      print(val);
      for (int j = 0; j < colors.length; j++) {
        if (val == colors[j].value) {
          print(val == colors[j].value);
        } else {
          result = 0;
          break;
        }
      }
    }
    setState(() {
      if (i >= colors.length) {
        print("color matches");
        match = 1;
       // check();
      } else {
        print("no match");
        match = 0;
      }
    });
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

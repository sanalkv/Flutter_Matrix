import "package:flutter/material.dart";
import "./home.dart";

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "database", home: Matrix(),theme: ThemeData(primaryColor: Colors.white),);
  }
}

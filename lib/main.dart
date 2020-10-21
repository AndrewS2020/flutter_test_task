import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random rnd = Random();
  Color _color = Colors.white;
  String _text = 'Hey there';

  Color getNextColor(){
    return  Color.fromARGB(255,
        rnd.nextInt(200)+55,
        rnd.nextInt(200)+55,
        rnd.nextInt(200)+55
    ); // don't want dark's colors
  }

  void _screenTap(){
    setState(() {
      _text = 'Hey there'; // or another ))
      _color = getNextColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: _screenTap,
        child:  Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: AnimatedContainer(
                alignment: Alignment.center,
                duration: Duration(milliseconds: 500),
                color: _color,
                child: Text(
                  _text,//'Hey there',
                  style: TextStyle(
                    color: getNextColor(),
                    fontSize: 32,
                    fontWeight: FontWeight.w900
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

}

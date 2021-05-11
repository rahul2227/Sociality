import 'package:flutter/material.dart';

class MainTimerScreen extends StatefulWidget {
  @override
  _MainTimerScreenState createState() => _MainTimerScreenState();
}

class _MainTimerScreenState extends State<MainTimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.amberAccent,
      child: Center(
        child: Text("This is the main screen controller"),
      ),
    );
  }
}

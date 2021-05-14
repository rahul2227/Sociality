import 'package:flutter/material.dart';
// This file will be used for the reference of the timer and understanding the code.

// import 'package:sociality/HelperFunctions/TimerPainter.dart';

class MainTimerDemoScreen extends StatefulWidget {
  @override
  _MainTimerDemoScreenState createState() => _MainTimerDemoScreenState();
}

class _MainTimerDemoScreenState extends State<MainTimerDemoScreen>
    with TickerProviderStateMixin {
  AnimationController controller;

  bool show = true;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void toggleVisibility() {
    setState(() {
      show = !show;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 240),
      // you need to provide the duration here in seconds for any
      // part like if you want counter for 4 min you will give value = 240
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Column(
                    children: <Widget>[
                      // Positioned.fill(
                      //   child: AnimatedBuilder(
                      //     animation: controller,
                      //     builder: (BuildContext context, Widget child) {
                      //       return CustomPaint(
                      //         painter: TimerPainter(
                      //             animation: controller,
                      //             backgroundColor: Colors.cyan,
                      //             color: theme.indicatorColor),
                      //       );
                      //     },
                      //   ),
                      // ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Time Left",
                              style: theme.textTheme.subtitle1,
                            ),
                            AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget child) {
                                return new Text(
                                  timerString, //this is the string that shows the counter
                                  style: theme.textTheme.headline3,
                                );
                              },
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  if (show)
                                    FloatingActionButton(
                                      child: AnimatedBuilder(
                                        animation: controller,
                                        builder: (BuildContext context,
                                            Widget child) {
                                          return new Icon(controller.isAnimating
                                              ? Icons.pause
                                              : Icons.play_arrow_outlined);
                                          // return new Icon( if(controller.isAnimating){
                                          //   toggleVisibility();
                                          // } else {
                                          //   Icons.play_arrow_outlined
                                          // }
                                          // );
                                        },
                                      ),
                                      onPressed: () {
                                        if (controller.isAnimating) {
                                          // toggleVisibility();
                                          controller.stop();
                                        } else {
                                          controller.reverse(
                                              from: controller.value == 0.0
                                                  ? 1.0
                                                  : controller.value);
                                          toggleVisibility();
                                        }
                                      },
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

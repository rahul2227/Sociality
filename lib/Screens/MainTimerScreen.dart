import 'package:flutter/material.dart';
// This file will be used for the reference of the timer and understanding the code.

import 'package:sociality/HelperFunctions/TimerPainter.dart';

class MainTimerScreen extends StatefulWidget {
  @override
  _MainTimerScreenState createState() => _MainTimerScreenState();
}

class _MainTimerScreenState extends State<MainTimerScreen>
    with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
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
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                              painter: TimerPainter(
                                  animation: controller,
                                  backgroundColor: Colors.cyan,
                                  color: theme.indicatorColor),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Count Down",
                              style: theme.textTheme.subtitle1,
                            ),
                            AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget child) {
                                return new Text(
                                  timerString,
                                  style: theme.textTheme.headline1,
                                );
                              },
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FloatingActionButton(
                                    child: AnimatedBuilder(
                                      animation: controller,
                                      builder:
                                          (BuildContext context, Widget child) {
                                        return new Icon(controller.isAnimating
                                            ? Icons.pause
                                            : Icons.play_arrow_outlined);
                                      },
                                    ),
                                    onPressed: () {
                                      if (controller.isAnimating)
                                        controller.stop();
                                      else {
                                        controller.reverse(
                                            from: controller.value == 0.0
                                                ? 1.0
                                                : controller.value);
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

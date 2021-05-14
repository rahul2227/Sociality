import 'package:flutter/material.dart';
import 'package:sociality/Screens/MainTimerScreen.dart';
import 'package:sociality/Screens/QuestBoardScreen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [MainTimerScreen(), Questboard()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded), label: ""),
          new BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
          // new BottomNavigationBarItem(icon: Icon(Icons.people)),
          // new BottomNavigationBarItem(icon: Icon(Icons.shield)),
        ],
      ),
    );
  }
}

// Note - The Function code below this is modified form of Tab bar and is used for 
// custom Bottom Navigation with image

// for something like this https://i.stack.imgur.com/V8lvz.gif
// Runner or calling code is something like this.

// bottomNavigationBar: CoBottomNavigationBar(
//         selectedFontSize: 16,
//         currentIndex: _selectedIndex,
//         selectedItemColor:Colors.yellow,
//         unselectedItemColor: Colors.black45,
//         onTap: _onItemTapped,
//         showUnselectedLabels: false,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             title: Text(
//               ' Home',
//             ),
//             backgroundColor: Colors.red,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.thumb_up,
//             ),
//             title: Text(
//               " Likes",
//             ),
//             backgroundColor: Colors.blue,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.search,
//             ),
//             title: Text(
//               ' Search',
//             ),
//             backgroundColor: Colors.pink,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.star,
//             ),
//             title: Text(
//               " Profile",
//             ),
//             backgroundColor: Colors.purple,
//           ),
//         ],
//       ),











// The Code is taken from 
//https://stackoverflow.com/questions/56829162/bottom-navigation-bar-design-in-flutter-expand-an-icon-when-its-clicked

// import 'dart:collection' show Queue;
// import 'dart:math' as math;
// import 'package:flutter/widgets.dart';
// import 'package:vector_math/vector_math_64.dart' show Vector3;

// enum BottomNavigationBarType {
//   fixed,
//   shifting,
// }

// class CoBottomNavigationBar extends StatefulWidget {
//   CoBottomNavigationBar({
//     Key key,
//     @required this.items,
//     this.onTap,
//     this.currentIndex = 0,
//     this.elevation = 8.0,
//     BottomNavigationBarType type,
//     Color fixedColor,
//     this.backgroundColor,
//     this.iconSize = 24.0,
//     Color selectedItemColor,
//     this.unselectedItemColor,
//     this.selectedFontSize = 14.0,
//     this.unselectedFontSize = 1,
//     this.showSelectedLabels = true,
//     bool showUnselectedLabels,
//   })  : assert(items != null),
//         assert(items.length >= 2),
//         assert(
//           items.every((BottomNavigationBarItem item) => item.title != null) ==
//               true,
//           'Every item must have a non-null title',
//         ),
//         assert(0 <= currentIndex && currentIndex < items.length),
//         assert(elevation != null && elevation >= 0.0),
//         assert(iconSize != null && iconSize >= 0.0),
//         assert(selectedItemColor != null ? fixedColor == null : true,
//             'Either selectedItemColor or fixedColor can be specified, but not both'),
//         assert(selectedFontSize != null && selectedFontSize >= 0.0),
//         assert(unselectedFontSize != null && unselectedFontSize >= 0.0),
//         assert(showSelectedLabels != null),
//         type = _type(type, items),
//         selectedItemColor = selectedItemColor ?? fixedColor,
//         showUnselectedLabels =
//             showUnselectedLabels ?? _defaultShowUnselected(_type(type, items)),
//         super(key: key);

//   final List<BottomNavigationBarItem> items;

//   /// `setState` to rebuild the bottom navigation bar with the new [currentIndex].
//   final ValueChanged<int> onTap;

//   /// The index into [items] for the current active [BottomNavigationBarItem].
//   final int currentIndex;

//   /// The z-coordinate of this [BottomNavigationBar].
//   ///
//   /// If null, defaults to `8.0`.
//   ///
//   /// {@macro flutter.material.material.elevation}
//   final double elevation;

//   /// Defines the layout and behavior of a [BottomNavigationBar].
//   ///
//   /// See documentation for [BottomNavigationBarType] for information on the
//   /// meaning of different types.
//   final BottomNavigationBarType type;

//   /// The value of [selectedItemColor].
//   ///
//   /// This getter only exists for backwards compatibility, the
//   /// [selectedItemColor] property is preferred.
//   Color get fixedColor => selectedItemColor;

//   /// The color of the [BottomNavigationBar] itself.
//   ///
//   /// If [type] is [BottomNavigationBarType.shifting] and the
//   /// [items]s, have [BottomNavigationBarItem.backgroundColor] set, the [item]'s
//   /// backgroundColor will splash and overwrite this color.
//   final Color backgroundColor;

//   /// The size of all of the [BottomNavigationBarItem] icons.
//   ///
//   /// See [BottomNavigationBarItem.icon] for more information.
//   final double iconSize;

//   /// The color of the selected [BottomNavigationBarItem.icon] and
//   /// [BottomNavigationBarItem.label].
//   ///
//   /// If null then the [ThemeData.primaryColor] is used.
//   final Color selectedItemColor;

//   /// The color of the unselected [BottomNavigationBarItem.icon] and
//   /// [BottomNavigationBarItem.label]s.
//   ///
//   /// If null then the [TextTheme.caption]'s color is used.
//   final Color unselectedItemColor;

//   /// The font size of the [BottomNavigationBarItem] labels when they are selected.
//   ///
//   /// Defaults to `14.0`.
//   final double selectedFontSize;

//   /// The font size of the [BottomNavigationBarItem] labels when they are not
//   /// selected.
//   ///
//   /// Defaults to `12.0`.
//   final double unselectedFontSize;

//   /// Whether the labels are shown for the selected [BottomNavigationBarItem].
//   final bool showUnselectedLabels;

//   /// Whether the labels are shown for the unselected [BottomNavigationBarItem]s.
//   final bool showSelectedLabels;

//   // Used by the [BottomNavigationBar] constructor to set the [type] parameter.
//   //
//   // If type is provided, it is returned. Otherwise,
//   // [BottomNavigationBarType.fixed] is used for 3 or fewer items, and
//   // [BottomNavigationBarType.shifting] is used for 4+ items.
//   static BottomNavigationBarType _type(
//     BottomNavigationBarType type,
//     List<BottomNavigationBarItem> items,
//   ) {
//     if (type != null) {
//       return type;
//     }
//     return items.length <= 3
//         ? BottomNavigationBarType.fixed
//         : BottomNavigationBarType.shifting;
//   }

//   // Used by the [BottomNavigationBar] constructor to set the [showUnselected]
//   // parameter.
//   //
//   // Unselected labels are shown by default for [BottomNavigationBarType.fixed],
//   // and hidden by default for [BottomNavigationBarType.shifting].
//   static bool _defaultShowUnselected(BottomNavigationBarType type) {
//     switch (type) {
//       case BottomNavigationBarType.shifting:
//         return false;
//       case BottomNavigationBarType.fixed:
//         return true;
//     }
//     assert(false);
//     return false;
//   }

//   @override
//   _BottomNavigationBarState createState() => _BottomNavigationBarState();
// }

// // This represents a single tile in the bottom navigation bar. It is intended
// // to go into a flex container.
// class _BottomNavigationTile extends StatelessWidget {
//   const _BottomNavigationTile(
//     this.type,
//     this.item,
//     this.animation,
//     this.iconSize, {
//     this.onTap,
//     this.colorTween,
//     this.flex,
//     this.selected = false,
//     @required this.selectedFontSize,
//     @required this.unselectedFontSize,
//     this.showSelectedLabels,
//     this.showUnselectedLabels,
//     this.indexLabel,
//   })  : assert(type != null),
//         assert(item != null),
//         assert(animation != null),
//         assert(selected != null),
//         assert(selectedFontSize != null && selectedFontSize >= 0),
//         assert(unselectedFontSize != null && unselectedFontSize >= 0);

//   final BottomNavigationBarType type;
//   final BottomNavigationBarItem item;
//   final Animation<double> animation;
//   final double iconSize;
//   final VoidCallback onTap;
//   final ColorTween colorTween;
//   final double flex;
//   final bool selected;
//   final double selectedFontSize;
//   final double unselectedFontSize;
//   final String indexLabel;
//   final bool showSelectedLabels;
//   final bool showUnselectedLabels;

//   @override
//   Widget build(BuildContext context) {
//     // In order to use the flex container to grow the tile during animation, we
//     // need to divide the changes in flex allotment into smaller pieces to
//     // produce smooth animation. We do this by multiplying the flex value
//     // (which is an integer) by a large number.
//     int size;

//     double bottomPadding = 14;
//     double topPadding = selectedFontSize / 2.0;

//     if (showSelectedLabels && !showUnselectedLabels) {
//       bottomPadding = Tween<double>(
//         begin: 0.0,
//         end: 14,
//       ).evaluate(animation);
//       topPadding = Tween<double>(
//         begin: selectedFontSize,
//         end: selectedFontSize / 2.0,
//       ).evaluate(animation);
//     }

//     // Center all icons if no labels are shown.
//     if (!showSelectedLabels && !showUnselectedLabels) {
//       bottomPadding = 14;
//       topPadding = selectedFontSize;
//     }

//     switch (type) {
//       case BottomNavigationBarType.fixed:
//         size = 1;
//         break;
//       case BottomNavigationBarType.shifting:
//         size = (flex * 1000.0).round();
//         break;
//     }
//     Color _color =
//         selected ? item.backgroundColor : colorTween.evaluate(animation);
//     Widget _label1 = selected
//         ? _Label(
//             colorTween: _color,
//             animation: animation,
//             item: item,
//             selectedFontSize: selectedFontSize,
//             unselectedFontSize: unselectedFontSize,
//             showSelectedLabels: showSelectedLabels,
//             showUnselectedLabels: showUnselectedLabels,
//           )
//         : Text("");
//     BoxDecoration _mydecoration = selected
//         ? BoxDecoration(
//             color: item.backgroundColor.withOpacity(0.5),
//             borderRadius: BorderRadius.all(Radius.circular(20)),
//           )
//         : BoxDecoration(color: Colors.white);

//     return Expanded(
//       flex: size,
//       child: Semantics(
//         container: true,
//         header: true,
//         selected: selected,
//         child: Stack(
//           children: <Widget>[
//             InkResponse(
//               onTap: onTap,
//               child: Container(
//                 decoration: _mydecoration,
//                 padding:
//                     EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     _TileIcon(
//                       colorTween: colorTween,
//                       animation: animation,
//                       iconSize: iconSize,
//                       selected: selected,
//                       item: item,
//                     ),
//                     _label1,
//                   ],
//                 ),
//               ),
//             ),
//             Semantics(
//               label: indexLabel,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _TileIcon extends StatelessWidget {
//   const _TileIcon({
//     Key key,
//     @required this.colorTween,
//     @required this.animation,
//     @required this.iconSize,
//     @required this.selected,
//     @required this.item,
//   })  : assert(selected != null),
//         assert(item != null),
//         super(key: key);

//   final ColorTween colorTween;
//   final Animation<double> animation;
//   final double iconSize;
//   final bool selected;
//   final BottomNavigationBarItem item;

//   @override
//   Widget build(BuildContext context) {
//     final Color iconColor =
//         selected ? item.backgroundColor : colorTween.evaluate(animation);
//     return Align(
//       alignment: Alignment.topCenter,
//       heightFactor: 1.0,
//       child: Container(
//         child: IconTheme(
//           data: IconThemeData(
//             color: iconColor,
//             size: iconSize,
//           ),
//           child: selected ? item.activeIcon : item.icon,
//         ),
//       ),
//     );
//   }
// }

// class _Label extends StatelessWidget {
//   const _Label({
//     Key key,
//     @required this.colorTween,
//     @required this.animation,
//     @required this.item,
//     @required this.selectedFontSize,
//     @required this.unselectedFontSize,
//     @required this.showSelectedLabels,
//     @required this.showUnselectedLabels,
//   })  : assert(colorTween != null),
//         assert(animation != null),
//         assert(item != null),
//         assert(selectedFontSize != null),
//         assert(unselectedFontSize != null),
//         assert(showSelectedLabels != null),
//         assert(showUnselectedLabels != null),
//         super(key: key);

//   final Color colorTween;
//   final Animation<double> animation;
//   final BottomNavigationBarItem item;
//   final double selectedFontSize;
//   final double unselectedFontSize;
//   final bool showSelectedLabels;
//   final bool showUnselectedLabels;

//   @override
//   Widget build(BuildContext context) {
//     Widget text = DefaultTextStyle.merge(
//       style: TextStyle(
//         fontSize: selectedFontSize,
//         color: colorTween,
//       ),
//       // The font size should grow here when active, but because of the way
//       // font rendering works, it doesn't grow smoothly if we just animate
//       // the font size, so we use a transform instead.
//       child: Transform(
//         transform: Matrix4.diagonal3(
//           Vector3.all(
//             Tween<double>(
//               begin: 0 / selectedFontSize,
//               end: 1.0,
//             ).evaluate(animation),
//           ),
//         ),
//         alignment: Alignment.bottomCenter,
//         child: item.title,
//       ),
//     );

//     if (!showUnselectedLabels && !showSelectedLabels) {
//       // Never show any labels.
//       text = Opacity(
//         alwaysIncludeSemantics: true,
//         opacity: 1.0,
//         child: text,
//       );
//     } else if (!showUnselectedLabels) {
//       // Fade selected labels in.
//       text = FadeTransition(
//         alwaysIncludeSemantics: true,
//         opacity: animation,
//         child: text,
//       );
//     } else if (!showSelectedLabels) {
//       // Fade selected labels out.
//       text = FadeTransition(
//         alwaysIncludeSemantics: true,
//         opacity: Tween<double>(begin: 1.0, end: 0.0).animate(animation),
//         child: text,
//       );
//     }

//     return Align(
//       alignment: Alignment.bottomCenter,
//       heightFactor: 1.0,
//       child: Container(child: text),
//     );
//   }
// }

// class _BottomNavigationBarState extends State<CoBottomNavigationBar>
//     with TickerProviderStateMixin {
//   List<AnimationController> _controllers = <AnimationController>[];
//   List<CurvedAnimation> _animations;

//   // A queue of color splashes currently being animated.
//   final Queue<_Circle> _circles = Queue<_Circle>();

//   // Last splash circle's color, and the final color of the control after
//   // animation is complete.
//   Color _backgroundColor;

//   static final Animatable<double> _flexTween =
//       Tween<double>(begin: 1.0, end: 1.5);

//   void _resetState() {
//     for (AnimationController controller in _controllers) controller.dispose();
//     for (_Circle circle in _circles) circle.dispose();
//     _circles.clear();

//     _controllers =
//         List<AnimationController>.generate(widget.items.length, (int index) {
//       return AnimationController(
//         duration: kThemeAnimationDuration,
//         vsync: this,
//       )..addListener(_rebuild);
//     });
//     _animations =
//         List<CurvedAnimation>.generate(widget.items.length, (int index) {
//       return CurvedAnimation(
//         parent: _controllers[index],
//         curve: Curves.fastOutSlowIn,
//         reverseCurve: Curves.fastOutSlowIn.flipped,
//       );
//     });
//     _controllers[widget.currentIndex].value = 1.0;
//     _backgroundColor = Colors.white;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _resetState();
//   }

//   void _rebuild() {
//     setState(() {
//       // Rebuilding when any of the controllers tick, i.e. when the items are
//       // animated.
//     });
//   }

//   @override
//   void dispose() {
//     for (AnimationController controller in _controllers) controller.dispose();
//     for (_Circle circle in _circles) circle.dispose();
//     super.dispose();
//   }

//   double _evaluateFlex(Animation<double> animation) =>
//       _flexTween.evaluate(animation);

//   void _pushCircle(int index) {
//     if (widget.items[index].backgroundColor != null) {
//       _circles.add(
//         _Circle(
//           state: this,
//           index: index,
//           color: Colors.white,
//           vsync: this,
//         )..controller.addStatusListener(
//             (AnimationStatus status) {
//               switch (status) {
//                 case AnimationStatus.completed:
//                   setState(() {
//                     final _Circle circle = _circles.removeFirst();
//                     _backgroundColor = circle.color;
//                     circle.dispose();
//                   });
//                   break;
//                 case AnimationStatus.dismissed:
//                 case AnimationStatus.forward:
//                 case AnimationStatus.reverse:
//                   break;
//               }
//             },
//           ),
//       );
//     }
//   }

//   @override
//   void didUpdateWidget(CoBottomNavigationBar oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     // No animated segue if the length of the items list changes.
//     if (widget.items.length != oldWidget.items.length) {
//       _resetState();
//       return;
//     }

//     if (widget.currentIndex != oldWidget.currentIndex) {
//       switch (widget.type) {
//         case BottomNavigationBarType.fixed:
//           break;
//         case BottomNavigationBarType.shifting:
//           _pushCircle(widget.currentIndex);
//           break;
//       }
//       _controllers[oldWidget.currentIndex].reverse();
//       _controllers[widget.currentIndex].forward();
//     } else {
//       if (_backgroundColor != widget.items[widget.currentIndex].backgroundColor)
//         _backgroundColor = Colors.white;
//     }
//   }

//   List<Widget> _createTiles() {
//     final MaterialLocalizations localizations =
//         MaterialLocalizations.of(context);
//     assert(localizations != null);

//     final ThemeData themeData = Theme.of(context);

//     Color themeColor;
//     switch (themeData.brightness) {
//       case Brightness.light:
//         themeColor = themeData.primaryColor;
//         break;
//       case Brightness.dark:
//         themeColor = themeData.accentColor;
//         break;
//     }

//     ColorTween colorTween;
//     switch (widget.type) {
//       case BottomNavigationBarType.fixed:
//         colorTween = ColorTween(
//           begin:
//               widget.unselectedItemColor ?? themeData.textTheme.caption.color,
//           end: widget.selectedItemColor ?? widget.fixedColor ?? themeColor,
//         );
//         break;
//       case BottomNavigationBarType.shifting:
//         colorTween = ColorTween(
//           begin: widget.unselectedItemColor ?? Colors.white,
//           end: widget.selectedItemColor ?? Colors.white,
//         );
//         break;
//     }

//     final List<Widget> tiles = <Widget>[];
//     for (int i = 0; i < widget.items.length; i++) {
//       tiles.add(_BottomNavigationTile(
//         widget.type,
//         widget.items[i],
//         _animations[i],
//         widget.iconSize,
//         selectedFontSize: widget.selectedFontSize,
//         unselectedFontSize: 1,
//         onTap: () {
//           if (widget.onTap != null) widget.onTap(i);
//         },
//         colorTween: colorTween,
//         flex: _evaluateFlex(_animations[i]),
//         selected: i == widget.currentIndex,
//         showSelectedLabels: widget.showSelectedLabels,
//         showUnselectedLabels: widget.showUnselectedLabels,
//         indexLabel: localizations.tabLabel(
//             tabIndex: i + 1, tabCount: widget.items.length),
//       ));
//     }
//     return tiles;
//   }

//   Widget _createContainer(List<Widget> tiles) {
//     return DefaultTextStyle.merge(
//       overflow: TextOverflow.ellipsis,
//       child: Padding(
//         padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
//         child: Row(
//           children: tiles,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     assert(debugCheckHasDirectionality(context));
//     assert(debugCheckHasMaterialLocalizations(context));
//     assert(debugCheckHasMediaQuery(context));

//     // Labels apply up to _bottomMargin padding. Remainder is media padding.
//     final double additionalBottomPadding = math.max(
//         MediaQuery.of(context).padding.bottom - widget.selectedFontSize / 2.0,
//         0.0);
//     Color backgroundColor;
//     switch (widget.type) {
//       case BottomNavigationBarType.fixed:
//         backgroundColor = widget.backgroundColor;
//         break;
//       case BottomNavigationBarType.shifting:
//         backgroundColor = Colors.white;
//         break;
//     }
//     return Semantics(
//       explicitChildNodes: true,
//       child: Material(
//         elevation: widget.elevation,
//         color: backgroundColor,
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//               minHeight: kBottomNavigationBarHeight + additionalBottomPadding),
//           child: CustomPaint(
//             painter: _RadialPainter(
//               circles: _circles.toList(),
//               textDirection: Directionality.of(context),
//             ),
//             child: Material(
//               // Splashes.
//               type: MaterialType.transparency,
//               child: MediaQuery.removePadding(
//                 context: context,
//                 removeBottom: true,
//                 child: _createContainer(_createTiles()),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Describes an animating color splash circle.
// class _Circle {
//   _Circle({
//     @required this.state,
//     @required this.index,
//     @required this.color,
//     @required TickerProvider vsync,
//   })  : assert(state != null),
//         assert(index != null),
//         assert(color != null) {
//     controller = AnimationController(
//       duration: kThemeAnimationDuration,
//       vsync: vsync,
//     );
//     animation = CurvedAnimation(
//       parent: controller,
//       curve: Curves.fastOutSlowIn,
//     );
//     controller.forward();
//   }

//   final _BottomNavigationBarState state;
//   final int index;
//   final Color color;
//   AnimationController controller;
//   CurvedAnimation animation;

//   double get horizontalLeadingOffset {
//     double weightSum(Iterable<Animation<double>> animations) {
//       // We're adding flex values instead of animation values to produce correct
//       // ratios.
//       return animations
//           .map<double>(state._evaluateFlex)
//           .fold<double>(0.0, (double sum, double value) => sum + value);
//     }

//     final double allWeights = weightSum(state._animations);
//     // These weights sum to the start edge of the indexed item.
//     final double leadingWeights =
//         weightSum(state._animations.sublist(0, index));

//     // Add half of its flex value in order to get to the center.
//     return (leadingWeights +
//             state._evaluateFlex(state._animations[index]) / 2.0) /
//         allWeights;
//   }

//   void dispose() {
//     controller.dispose();
//   }
// }

// // Paints the animating color splash circles.
// class _RadialPainter extends CustomPainter {
//   _RadialPainter({
//     @required this.circles,
//     @required this.textDirection,
//   })  : assert(circles != null),
//         assert(textDirection != null);

//   final List<_Circle> circles;
//   final TextDirection textDirection;

//   // Computes the maximum radius attainable such that at least one of the
//   // bounding rectangle's corners touches the edge of the circle. Drawing a
//   // circle larger than this radius is not needed, since there is no perceivable
//   // difference within the cropped rectangle.
//   static double _maxRadius(Offset center, Size size) {
//     final double maxX = math.max(center.dx, size.width - center.dx);
//     final double maxY = math.max(center.dy, size.height - center.dy);
//     return math.sqrt(maxX * maxX + maxY * maxY);
//   }

//   @override
//   bool shouldRepaint(_RadialPainter oldPainter) {
//     if (textDirection != oldPainter.textDirection) return true;
//     if (circles == oldPainter.circles) return false;
//     if (circles.length != oldPainter.circles.length) return true;
//     for (int i = 0; i < circles.length; i += 1)
//       if (circles[i] != oldPainter.circles[i]) return true;
//     return false;
//   }

//   @override
//   void paint(Canvas canvas, Size size) {
//     for (_Circle circle in circles) {
//       final Paint paint = Paint()..color = circle.color;
//       final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
//       canvas.clipRect(rect);
//       double leftFraction;
//       switch (textDirection) {
//         case TextDirection.rtl:
//           leftFraction = 1.0 - circle.horizontalLeadingOffset;
//           break;
//         case TextDirection.ltr:
//           leftFraction = circle.horizontalLeadingOffset;
//           break;
//       }
//       final Offset center =
//           Offset(leftFraction * size.width, size.height / 2.0);
//       final Tween<double> radiusTween = Tween<double>(
//         begin: 0.0,
//         end: _maxRadius(center, size),
//       );
//       canvas.drawCircle(
//         center,
//         radiusTween.transform(circle.animation.value),
//         paint,
//       );
//     }
//   }
// }

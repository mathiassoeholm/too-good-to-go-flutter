import 'package:flutter/material.dart';

class OnPressOverlay extends StatefulWidget {
  final VoidCallback onPressed;

  const OnPressOverlay({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  _OnPressOverlayState createState() => _OnPressOverlayState();
}

class _OnPressOverlayState extends State<OnPressOverlay> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<Color> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );

    animation = ColorTween(
        begin: null,
        end: Colors.black26,
    ).animate(controller)
      ..addListener(() { setState(() {
          // Make sure the widget is updated
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        controller.animateTo(1, duration: Duration(milliseconds: 50));
      },
      onTapCancel: () {
        controller.reverse();
      },
      onTapUp: (_) {
        controller.reverse();

        if (widget.onPressed != null) {
          widget.onPressed();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

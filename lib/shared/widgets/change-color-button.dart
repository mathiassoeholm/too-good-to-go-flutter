import 'package:flutter/material.dart';

class ChangeColorButton extends StatefulWidget {
  final IconData iconData;
  final double size;
  final EdgeInsets padding;
  final VoidCallback onPressed;
  
  const ChangeColorButton({
    this.iconData,
    this.size,
    this.padding,
    this.onPressed,
  });
  
  @override
  _ChangeColorButtonState createState() => _ChangeColorButtonState();
}

class _ChangeColorButtonState extends State<ChangeColorButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) =>
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        setState(() { _isPressed = true; });
      },
      onTapUp: (_) {
        setState(() { _isPressed = false; });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() { _isPressed = false; });
      },
      child: Container(
        padding: widget.padding,
        child: Icon(
          widget.iconData,
          size: widget.size,
          color: _isPressed ? Colors.grey : Colors.white,
        ),
      ),
    );
}
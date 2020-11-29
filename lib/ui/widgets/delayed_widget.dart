import 'package:flutter/material.dart';

class DelayedWidget extends StatefulWidget {
  final Widget child;
  final int delayMilliseconds;

  const DelayedWidget({
    Key key,
    @required this.child,
    this.delayMilliseconds = 0,
  }) : super(key: key);

  @override
  _DelayedWidgetState createState() => _DelayedWidgetState();
}

class _DelayedWidgetState extends State<DelayedWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInBack,
    );

    Future.delayed(
      Duration(milliseconds: widget.delayMilliseconds),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value.clamp(0.0, 1.0),
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
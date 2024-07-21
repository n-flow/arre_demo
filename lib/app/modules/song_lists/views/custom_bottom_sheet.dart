import 'package:arre_demo/app/utils/resolution.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomBottomSheet extends StatefulWidget {
  final Widget child;
  final DismissDirectionCallback? onDismissed;

  const CustomBottomSheet({super.key, required this.child, this.onDismissed});

  @override
  CustomBottomSheetState createState() => CustomBottomSheetState();
}

class CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  final double _dragOffset = 0.0;
  double _maxHeight = kBottomNavigationBarHeight + SDP.hdp(40);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addListener(() {
      setState(() {});
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _maxHeight = kBottomNavigationBarHeight + SDP.hdp(40);
      });
    });
  }

  void toggle() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.down,
      key: const Key('key'),
      onDismissed: widget.onDismissed,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _controller.value * _maxHeight - _dragOffset),
            child: SizedBox(
              height: _maxHeight,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

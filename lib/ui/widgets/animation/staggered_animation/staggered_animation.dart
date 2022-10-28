import 'package:flutter/material.dart';

class StaggeredDemoAnimation extends StatelessWidget {
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius?> borderRadious;
  final Animation<Color?> color;
  final Animation<double> controller;


  // ignore: use_key_in_widget_constructors
  StaggeredDemoAnimation(
      {Key? key, required this.controller})
      : opacity = Tween<double>(begin: 0.0, end: 1).animate(CurvedAnimation(
          parent: controller,
          curve: const Interval(0, 0.01, curve: Curves.bounceIn),
        )),
        width = Tween<double>(begin: 50, end: 150).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 1, curve: Curves.linear))),
        height = Tween<double>(begin: 10, end: 50).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.1, curve: Curves.easeInToLinear))),
        padding = Tween<EdgeInsets>(
                begin: const EdgeInsets.only(bottom: 16.0),
                end: const EdgeInsets.only(bottom: 75.0))
            .animate(CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.1, curve: Curves.ease))),
        borderRadious = Tween<BorderRadius>(
                begin: BorderRadius.circular(0.0),
                end: BorderRadius.circular(10))
            .animate(CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.1, curve: Curves.ease))),
        color = Tween<Color>(begin: Colors.red, end: Colors.amber).animate(
            CurvedAnimation(
                parent: controller,
                curve: const Interval(0, 0.1, curve: Curves.ease)));

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Opacity(
      opacity: opacity.value,
      child: Container(
        width: width.value,
        height: height.value,
        decoration: BoxDecoration(
            color: color.value, borderRadius: borderRadious.value),
        child: const Text('hello'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }
}

class StaggeredAnimation extends StatefulWidget {
  
  const StaggeredAnimation({Key? key}) : super(key: key);

  @override
  State<StaggeredAnimation> createState() => _StaggeredAnimationState();
}

class _StaggeredAnimationState extends State<StaggeredAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  

  _StaggeredAnimationState();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
        _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // Future<void> playAnimation() async {
  //   try {
  //     await _controller.forward();
  //     await _controller.reverse();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredDemoAnimation(
            controller: _controller,
           
          )
    );
  }
}

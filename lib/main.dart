import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opacity',
      home: _AnimatedOpacityExample(),
    );
  }
}

class _AnimatedOpacityExample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AnimatedOpacityExampleState();
  }
}

class _AnimatedOpacityExampleState extends State<_AnimatedOpacityExample> {

  double _opacity = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity ex'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 3),
              curve: Curves.bounceInOut,
              onEnd: () {
              },
              child: Container(
                width: 150,
                height: 60,
                color: Colors.teal,
                child: const Center(
                  child: const Text(
                      'Home',
                      style: const TextStyle(fontSize: 24, color: Colors.white)
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Change opacity'),
              onPressed: () {
                setState(() {
                  _opacity = _opacity == 0.1 ? 1 : 0.1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// animation for text style
//
// class FlutterAnimations extends StatefulWidget {
//   @override
//   _FlutterAnimationsState createState() => _FlutterAnimationsState();
// }
//
// class _FlutterAnimationsState extends State<FlutterAnimations> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<TextStyle> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000,),
//     );
//
//     _animation = TextStyleTween(
//       begin: TextStyle(
//         fontSize: 20.0,
//         color: Colors.black,
//         fontWeight: FontWeight.w300,
//       ),
//       end: TextStyle(
//         fontSize: 40.0,
//         color: Colors.blue,
//         fontWeight: FontWeight.w900,
//       ),
//     ).animate(_controller);
//
//     _animation.addListener(() {
//       setState(() {});
//     });
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Animations!',
//           style: _animation.value,
//         ),
//       ),
//     );
//   }
// }

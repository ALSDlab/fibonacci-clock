import 'dart:math';

import 'package:flutter/material.dart';

class FibonacciSpiral extends StatelessWidget {
  const FibonacciSpiral({super.key});

  @override
  Widget build(BuildContext context) {
    double firstBox = 15;

    return Stack(alignment: Alignment.center, children: [
      Container(
        margin: EdgeInsets.only(right: firstBox * 9, bottom: firstBox * 7),
        child: Stack(
          children: [
            SizedBox(
              width: firstBox * 13,
              height: firstBox * 13,
              child: CircularArc(pi * 3 / 2),
            ),
            Positioned(
              left: firstBox * 5,
              child: SizedBox(
                width: firstBox * 8,
                height: firstBox * 8,
                child: CircularArc(pi),
              ),
            ),
            Positioned(
              left: firstBox * 5,
              top: firstBox * 3,
              child: SizedBox(
                width: firstBox * 5,
                height: firstBox * 5,
                child: CircularArc(pi / 2),
              ),
            ),
            Positioned(
              left: firstBox * 7,
              top: firstBox * 7,
              child: SizedBox(
                width: firstBox * 3,
                height: firstBox * 3,
                child: CircularArc(0),
              ),
            ),
            Positioned(
              left: firstBox * 9,
              top: firstBox * 8,
              child: SizedBox(
                width: firstBox * 2,
                height: firstBox * 2,
                child: CircularArc(pi * 3 / 2),
              ),
            ),
            Positioned(
              left: firstBox * 10,
              top: firstBox * 8,
              child: SizedBox(
                width: firstBox,
                height: firstBox,
                child: CircularArc(pi),
              ),
            ),
            Positioned(
              left: firstBox * 10,
              top: firstBox * 8,
              child: SizedBox(
                width: firstBox,
                height: firstBox,
                child: CircularArc(pi / 2),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    ]);
  }
}


class CircularArc extends StatelessWidget {
  double angle;

  CircularArc(this.angle, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircularArcPainter(angle),
    );
  }
}

class CircularArcPainter extends CustomPainter {
  double firstAngle;

  CircularArcPainter(this.firstAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width;
    final double centerY = size.height;
    final double radius = size.width;

    final double startAngle = firstAngle; // 호의 시작 각도 (라디안)
    const double endAngle = pi / 2; // 호의 끝 각도 (라디안)

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      startAngle,
      endAngle,
      false,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5.0,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// class RotationContainer extends StatefulWidget {
//   const RotationContainer({super.key});
//
//   @override
//   _RotationContainerState createState() => _RotationContainerState();
// }
//
// class _RotationContainerState extends State<RotationContainer>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // 애니메이션 컨트롤러 초기화
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 60),
//     );
//
//     // 회전 애니메이션 정의
//     _animation = Tween<double>(
//       begin: 0,
//       end: -2 * pi,
//     ).animate(_controller);
//
//     // 애니메이션 반복
//     _controller.repeat();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         return Transform.rotate(
//           angle: _animation.value,
//           child: const FibonaccoSpiral(),
//         );
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     // 페이지가 dispose될 때 애니메이션 컨트롤러 해제
//     _controller.dispose();
//     super.dispose();
//   }
// }

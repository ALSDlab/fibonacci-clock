import 'dart:math';

import 'package:fibonacci_spiral/widgets/fibonacci_spiral.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';


class BackgroundIndicator extends StatelessWidget {
  const BackgroundIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final heightSize = MediaQuery.of(context).size.height;
    final widthSize = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: CustomRectClipper1(),
          child: Transform.rotate(
              angle: 30 * (pi / 180), // 30도를 라디안으로 변환 2시
              child: const FibonaccoSpiral()),
        ),
        ClipPath(
          clipper: CustomRectClipper1(),
          child: Transform.rotate(
              angle: 60 * (pi / 180), // 60도를 라디안으로 변환 1시
              child: const FibonaccoSpiral()),
        ),
        ClipPath(
          clipper: CustomRectClipper2(),
          child: Transform.rotate(
              angle: 90 * (pi / 180), // 90도를 라디안으로 변환 0시
              child: const FibonaccoSpiral()),
        ),
        ClipPath(
          clipper: CustomRectClipper2(),
          child: Transform.rotate(
              angle: 120 * (pi / 180), // 120도를 라디안으로 변환 11시
              child: const FibonaccoSpiral()),
        ),
        ClipPath(
          clipper: CustomRectClipper2(),
          child: Transform.rotate(
              angle: 150 * (pi / 180), // 150도를 라디안으로 변환 10시
              child: const FibonaccoSpiral()),
        ),
        ClipPath(
          clipper: CustomRectClipper2(),
          child: Transform.rotate(
              angle: 180 * (pi / 180), // 180도를 라디안으로 변환 9시
              child: const FibonaccoSpiral()),
        ),
        ClipPath(
          clipper: CustomRectClipper2(),
          child: Transform.rotate(
              angle: 210 * (pi / 180), // 210도를 라디안으로 변환 8시
              child: const FibonaccoSpiral()),
        ),
        ClipPath(
          clipper: CustomRectClipper2(),
          child: Transform.rotate(
              angle: 240 * (pi / 180), // 240도를 라디안으로 변환 7시
              child: const FibonaccoSpiral()),
        ),
        ClipPath(
          clipper: CustomRectClipper1(),
          child: Transform.rotate(
              angle: 270 * (pi / 180), // 270도를 라디안으로 변환 6시
              child: const FibonaccoSpiral()),
        ),
        ClipPath(
          clipper: CustomRectClipper1(),
          child: Transform.rotate(
              angle: 300 * (pi / 180), // 300도를 라디안으로 변환 5시
              child: const FibonaccoSpiral()),
        ),
        ClipPath(
          clipper: CustomRectClipper1(),
          child: Transform.rotate(
              angle: 330 * (pi / 180), // 330도를 라디안으로 변환 4시
              child: const FibonaccoSpiral()),
        ),
        ClipPath(
          clipper: CustomRectClipper1(),
          child: const FibonaccoSpiral(),  // 3시
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: double.infinity,
              color: Colors.white,
            ),
            Container(
              width: 100,
              height: double.infinity,
              color: Colors.white,
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.only(top:  heightSize * 0.11, left: widthSize * 0.17),
          child: const Column(
            children: [
              Text('6', style: TextStyle(color: Colors.pink, fontSize: 20)),
              Text('5', style: TextStyle(color: Colors.pink, fontSize: 19)),
              Text('4', style: TextStyle(color: Colors.pink, fontSize: 18)),
              Text('3', style: TextStyle(color: Colors.pink, fontSize: 17)),
              Text('2', style: TextStyle(color: Colors.pink, fontSize: 16)),
              Text('1', style: TextStyle(color: Colors.pink, fontSize: 16)),
            ],
          ),
        ),
         Padding(
          padding: EdgeInsets.only(top: heightSize * 0.54, right: widthSize * 0.2),
          child: const Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('7', style: TextStyle(color: Colors.pink, fontSize: 16)),
                    Text('8', style: TextStyle(color: Colors.pink, fontSize: 16)),
                    Text('9', style: TextStyle(color: Colors.pink, fontSize: 17)),
                    Text('10', style: TextStyle(color: Colors.pink, fontSize: 18)),
                    Text('11', style: TextStyle(color: Colors.pink, fontSize: 19)),
                    Text('12', style: TextStyle(color: Colors.pink, fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ),
        AnalogClock(
          dateTime: DateTime.now(),
          isKeepTime: true,
          dialColor: Colors.transparent,
          dialBorderColor: null,
          dialBorderWidthFactor: 0.02,
          markingColor: Colors.pink,
          markingRadiusFactor: 0.4,
          markingWidthFactor: 0.5,
          hourNumberColor: null,
          hourNumberSizeFactor: 1.0,
          hourNumberRadiusFactor: 1.0,
          hourHandColor: null,
          minuteHandColor: Colors.pink,
          minuteHandWidthFactor: 2.0,
          minuteHandLengthFactor: 1.0,
          secondHandColor: null,
          secondHandWidthFactor: 1.0,
          secondHandLengthFactor: 1.0,
          centerPointColor: Colors.black,
          centerPointWidthFactor: 1.0,
        )
      ],
    );
  }
}

class CustomRectClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width * 10 / 22, -size.height)
      ..lineTo(size.width * 10 / 22, size.height * 5 / 20)
      ..lineTo(size.width * 12 / 22, size.height * 5 / 20)
      ..lineTo(size.width * 12 / 22, -size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomRectClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width * 10 / 22, size.height * 15 / 20)
      ..lineTo(size.width * 10 / 22, size.height * 2)
      ..lineTo(size.width * 12 / 22, size.height * 2)
      ..lineTo(size.width * 12 / 22, size.height * 15 / 20)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

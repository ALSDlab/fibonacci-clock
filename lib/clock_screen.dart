import 'dart:math';

import 'package:fibonacci_spiral/widgets/background_indicator.dart';
import 'package:fibonacci_spiral/widgets/fibonacci_spiral.dart';
import 'package:fibonacci_spiral/widgets/time_clock.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const Expanded(child: TimeClock()),
            Expanded(
              flex: 8,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const BackgroundIndicator(),
                  TimerBuilder.periodic(const Duration(seconds: 1), builder: (context) {
                    DateTime nowTime = DateTime.now();
                    int hour = nowTime.hour;
                    int minute = nowTime.minute;
                    int minutes = hour * 60 + minute;
                    final radian = pi / 2 - pi * (0.5 / 180) * minutes;
                    return Transform.rotate(
                        angle: radian, //
                        child: const FibonaccoSpiral());
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

class TimeClock extends StatelessWidget {
  const TimeClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TimerBuilder.periodic(
          const Duration(seconds: 1),
          builder: (context) {
            return Text(
              formatDate(DateTime.now(), [hh, ':', nn, ':', ss, ' ', am]),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      ],
    );
  }
}
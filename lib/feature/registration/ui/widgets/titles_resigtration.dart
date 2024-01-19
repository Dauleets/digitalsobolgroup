import 'package:flutter/material.dart';

class TitlesRegistrationWidget extends StatelessWidget {
  final String title1;
  final String title2;

  const TitlesRegistrationWidget({
    super.key,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Text(
          title1,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 34, fontWeight: FontWeight.w700, letterSpacing: 0.37),
        ),
        const SizedBox(height: 20),
        Text(
          title2,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: -0.24),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

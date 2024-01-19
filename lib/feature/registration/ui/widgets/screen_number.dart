import 'package:flutter/material.dart';

class ScreenNumberWidgets extends StatelessWidget {
  final int number;
  const ScreenNumberWidgets({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: number == 1
                ? Theme.of(context).colorScheme.secondary
                : const Color.fromRGBO(236, 236, 236, 1),
          ),
          child: Center(
            child: Text(
              '1',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Container(
          width: 30,
          height: 2.0,
          color: const Color.fromRGBO(236, 236, 236, 1),
        ),
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: number == 2
                ? Theme.of(context).colorScheme.secondary
                : const Color.fromRGBO(236, 236, 236, 1),
          ),
          child: Center(
            child: Text(
              '2',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Container(
          width: 30,
          height: 2.0,
          color: const Color.fromRGBO(236, 236, 236, 1),
        ),
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: number == 3
                ? Theme.of(context).colorScheme.secondary
                : const Color.fromRGBO(236, 236, 236, 1),
          ),
          child: Center(
            child: Text(
              '3',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
        )
      ],
    );
  }
}

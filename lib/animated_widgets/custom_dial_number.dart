import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

import 'custom_rotational_dialog_picker.dart';


const _dialNumberRadius = RotaryDialConstants.rotaryRingWidth / 2 -
    (RotaryDialConstants.rotaryRingPadding +
        RotaryDialConstants.dialNumberPadding);

class DialNumber extends StatelessWidget {
  const DialNumber({
    required this.number,
    super.key,
  });

  final int number;

  @override
  Widget build(BuildContext context) {
    return LocalHero(
      tag: 'digit_$number',
      child: Container(
        height: _dialNumberRadius * 2,
        width: _dialNumberRadius * 2,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$number',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
class InputModeButton extends StatelessWidget {
  const InputModeButton({
    required this.animationDuration,
    required this.simpleInputMode,
    required this.onModeChanged,
    super.key,
  });

  final Duration animationDuration;
  final bool simpleInputMode;
  final VoidCallback onModeChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      alignment: Alignment.centerLeft,
      firstCurve: Curves.easeInOutCubic,
      secondCurve: Curves.easeInOutCubic,
      firstChild: _Button(label: 'Rotational', onTap: onModeChanged),
      secondChild: _Button(label: 'Simple', onTap: onModeChanged),
      crossFadeState: simpleInputMode
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: animationDuration,
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

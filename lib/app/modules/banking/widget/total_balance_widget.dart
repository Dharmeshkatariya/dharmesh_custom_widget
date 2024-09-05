import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class TotalBalanceWidget extends StatelessWidget {
  const TotalBalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: '\$3,782.',
            style: TextStyle(
              fontSize: 34,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            children: [
              TextSpan(
                text: '02',
                style: TextStyle(
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.plantGreen,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: const Text(
            '+4.50%',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

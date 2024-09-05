import 'package:dharmesh_widget_component/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../bank_model.dart';

class TransactionDetailsTile extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionDetailsTile({
    required this.transaction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 62,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.veryLightGreen,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(transaction.category.icon,
                size: 26, color: AppColors.darkGreen),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.payee,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  transaction.date.toString().split('.')[0],
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              const SizedBox(height: 9),
              Text(
                '${transaction.isIncome ? '+' : '-'} \$${transaction.amount}',
                style: TextStyle(
                  fontSize: 19,
                  color: transaction.isIncome
                      ? AppColors.darkGreen
                      : AppColors.darkRed,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

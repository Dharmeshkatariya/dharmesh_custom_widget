import 'package:dharmesh_widget_component/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bank_model.dart';
import '../widget/chart.dart';
import '../widget/header_widget.dart';
import '../widget/icon_holder_widget.dart';
import '../widget/profile_widget.dart';
import '../widget/transaction_details_tile_widget.dart';

class BankingHomeView extends StatefulWidget {
  const BankingHomeView({super.key});

  @override
  State<BankingHomeView> createState() => _BankingHomeViewState();
}

class _BankingHomeViewState extends State<BankingHomeView> {
  int selectedChart = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Header(
                heading: 'Welcome, ',
                subHeading: 'John!',
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.only(
                    left: 20, right: 29, top: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Savings',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 25),
                    LineChartSample(
                      lineColor: Colors.white,
                      gradientColors: [
                        Colors.white.withOpacity(0.6),
                        Colors.white.withOpacity(0.0),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              showPagerDots(),
              const SizedBox(height: 25),
              Text(
                'Total Balance',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '\$ 16,033.44',
                style: TextStyle(
                  fontSize: 33,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              showTransactionProfilePhotos(),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction history',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 17),
                ],
              ),
              const SizedBox(height: 10),
              ...TransactionModel.dummyData.map((TransactionModel transaction) {
                return TransactionDetailsTile(transaction: transaction);
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget showTransactionProfilePhotos() {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int index = 1; index < 4; index++)
            ProfileWidget(
              assetPath: 'assets/profile/profile_${index + 1}.jpeg',
              isOnline: index.isOdd,
            ),
          const ProfileWidget(
            assetPath: 'assets/profile/profile_5.jpeg',
            showCount: true,
            count: '7',
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 60,
              height: 60,
              color: Colors.grey.shade300.withOpacity(0.7),
              child: Icon(Icons.more_horiz_rounded, size: 27),
            ),
          ),
        ],
      ),
    );
  }

  Widget showPagerDots() {
    selectedChart = selectedChart.clamp(0, 2);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const IconHolder(
          iconData: CupertinoIcons.chart_bar_alt_fill,
          iconColor: AppColors.darkRed,
          side: 50,
          backgroundColor: AppColors.veryLightRed,
          iconSize: 23,
          radius: 13,
        ),
        SizedBox(
          height: 20,
          width: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int index = 0; index < 3; index++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: selectedChart == index
                            ? AppColors.lightGreen
                            : Colors.transparent),
                  ),
                  padding: selectedChart == index
                      ? const EdgeInsets.all(4)
                      : const EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedChart == index
                          ? AppColors.lightGreen
                          : AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
            ],
          ),
        ),
        IconHolder(
          iconData: Icons.copy_rounded,
          iconColor: AppColors.lightGreen,
          side: 50,
          backgroundColor: AppColors.veryLightGreen,
          iconSize: 23,
          radius: 13,
        ),
      ],
    );
  }
}

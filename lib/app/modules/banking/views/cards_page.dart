import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../widget/card_spendings_chart_widget.dart';
import '../widget/clients_count_widget.dart';
import '../widget/header_widget.dart';
import '../widget/your_cards_widget.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  int selectedChart = 0;
  bool clientBox = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Header(
                heading: '    ',
                subHeading: 'Overview',
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Text(
                    'Hey',
                    style: TextStyle(
                      fontSize: 28,
                      color: AppColors.darkBlueGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ' John!',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'What will you do today?',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.darkBlueGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: .8,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100.withOpacity(.6),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(
                    left: 20, right: 2, top: 2, bottom: 2),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search here',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.darkRed,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const CardSpendingsChartWidget(),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClientsCountWidget(),
                  YourCardsWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
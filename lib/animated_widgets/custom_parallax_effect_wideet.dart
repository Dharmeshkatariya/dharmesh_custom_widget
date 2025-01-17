import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'custom_scroll_effect.dart';




class CustomSlidingCardsView extends StatefulWidget {
  const CustomSlidingCardsView({super.key});

  @override
  State<CustomSlidingCardsView> createState() => _CustomSlidingCardsViewState();
}

class _CustomSlidingCardsViewState extends State<CustomSlidingCardsView> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.62,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: pageController,
        itemCount: demoCardData.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double pageOffset = 0;
              if (pageController.position.haveDimensions) {
                pageOffset = pageController.page! - index;
              }
              double gauss = math.exp(-(math.pow((pageOffset.abs() - 0.5), 2) / 0.08));
              return Transform.translate(
                offset: Offset(-32 * gauss * pageOffset.sign, 0),
                child: Container(
                  clipBehavior: Clip.none,
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(8, 20),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(32)),
                        child: Image.asset(
                          'assets/images/${demoCardData[index].image}',
                          height: MediaQuery.of(context).size.height * 0.3,
                          alignment: Alignment(-pageOffset.abs(), 0),
                          fit: BoxFit.none,
                        ),
                      ),
                      Expanded(child: child!),
                    ],
                  ),
                ),
              );
            },
            child: Column(
              children: [
                const SizedBox(height: 8),
                Expanded(
                  child: CardContent(
                    name: demoCardData[index].name,
                    date: demoCardData[index].date,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



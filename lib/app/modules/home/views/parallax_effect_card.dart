import 'package:dharmesh_widget_component/animated_widgets/custom_parallax_effect_wideet.dart';
import 'package:flutter/material.dart';

import '../../../../animated_widgets/custom_scroll_effect.dart';
import '../../banking/widget/header_widget.dart';

class CustomParallaxCardsView extends StatelessWidget {
  const CustomParallaxCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                Header(heading: 'Dharmesh',),
                SizedBox(height: 40),
                Tabs(),
                SizedBox(height: 8),
                CustomSlidingCardsView(),
              ],
            ),
          ),
          ExhibitionBottomSheet(), //use this or ScrollableExhibitionSheet
        ],
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 24),
        MyTab(text: 'Nearby', isSelected: false),
        MyTab(text: 'Recent', isSelected: true),
        MyTab(text: 'Notice', isSelected: false),
      ],
    );
  }
}

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const MyTab({super.key, required this.isSelected, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: isSelected ? 16 : 14,
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? const Color(0xFFFF5A1D) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}


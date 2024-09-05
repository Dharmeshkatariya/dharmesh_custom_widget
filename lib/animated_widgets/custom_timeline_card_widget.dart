import 'package:flutter/material.dart';

import 'package:boxy/boxy.dart';

import 'custom_timeline_web.dart';

class CustomTimeLineCard extends StatelessWidget {
  final TimeLineData data;
  const CustomTimeLineCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: data.animation,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 50,
            width: 200,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 5), blurRadius: 10),
                ]),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 4,
                  color: data.color,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  data.label,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: data.color),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: data.color, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  data.isActive ? Icons.check : Icons.question_mark,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class CustomTimeLine extends StatefulWidget {
  final List<TimeLineItem> content;
  final Color activeColor;
  final Color inactiveColor;

  const CustomTimeLine(
      {super.key,
        required this.content,
        required this.activeColor,
        required this.inactiveColor});

  @override
  State<CustomTimeLine> createState() => _CustomTimeLineState();
}

class _CustomTimeLineState extends State<CustomTimeLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  final scaleTween = Tween<double>(begin: 0.0, end: 1.0);
  List<TimeLineData> animatedContent = [];
  List<Animation<double>> connectorsAnimations = [];

  @override
  void initState() {
    super.initState();
    final numOfWidgets = widget.content.length + widget.content.length * 2 - 2;
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: (numOfWidgets) * 300));
    final interval = 1.0 / numOfWidgets;
    for (int i = 0; i < numOfWidgets; i++) {
      final double begin = i - 1 < 0 ? 0 : (i - 1) * interval;
      final double end = i == 0 ? interval : i * interval;
      final itemAnimation = scaleTween.animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            begin,
            end,
            curve: Curves.ease,
          ),
        ),
      );
      if (i % 3 == 0) {
        final item = widget.content[i~/3];
        animatedContent.add(TimeLineData(
            label: item.label,
            color: item.color,
            isActive: item.isActive,
            animation: itemAnimation));
      } else {
        connectorsAnimations.add(itemAnimation);
      }
    }
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBoxy(
        delegate: TimeLineDelegate(
            content: animatedContent,
            activeColor: widget.activeColor,
            connectorsAnimations: connectorsAnimations,
            inactiveColor: widget.inactiveColor));
  }
}


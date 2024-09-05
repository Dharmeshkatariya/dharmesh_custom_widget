import '../../../../animated_widgets/custom_timeline_card_widget.dart';
import '../../../../animated_widgets/custom_timeline_web.dart';
import '../../../../utils/export.dart';

class TimeLineView extends StatelessWidget {
  TimeLineView({super.key});

  final activeColor = Colors.blue[800]!;
  final inactiveColor = Colors.grey[600]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: CustomTimeLine(
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              content: [
                TimeLineItem(label: "First Lecture", color: activeColor),
                TimeLineItem(label: "Second Lecture", color: activeColor),
                TimeLineItem(label: "Third Lecture", color: activeColor),
                TimeLineItem(label: "Fourth Lecture", color: activeColor),
                TimeLineItem(
                    label: "Fifth Lecture", color: inactiveColor, isActive: false),
                TimeLineItem(
                    label: "Sixth Lecture", color: inactiveColor, isActive: false),
              ],
            )));
  }
}

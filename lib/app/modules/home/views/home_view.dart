import 'package:dharmesh_widget_component/animated_widgets/custom_animated_women_widget.dart';
import 'package:dharmesh_widget_component/app/modules/home/views/parallax_effect_card.dart';
import 'package:dharmesh_widget_component/app/modules/home/views/rotatinal_dialer_picker.dart';
import 'package:dharmesh_widget_component/app/modules/home/views/timeline_view.dart';
import 'package:dharmesh_widget_component/app/modules/home/views/transform_page.dart';
import 'package:get/get.dart';

import '../../../../utils/export.dart';
import '../../banking/widget/header_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
              const SizedBox(height: 10),
              Column(
                children: [
                  CommonButton(
                    text: "Transform page",
                    ontap: () {
                      Get.to(const TransformView());
                    },
                  ),
                  20.verticalSpace,
                  CommonButton(
                    text: "Animated page",
                    ontap: () {
                      Get.to(const CustomWomenAnimatedWidget());
                    },
                  ),
                  20.verticalSpace,
                  CommonButton(
                    text: "Parallax effect page",
                    ontap: () {
                      Get.to(const CustomParallaxCardsView());
                    },
                  ),
                  20.verticalSpace,
                  CommonButton(
                    text: "TimeLine page",
                    ontap: () {
                      Get.to(TimeLineView());
                    },
                  ),
                  20.verticalSpace,
                  CommonButton(
                    text: "BankCard",
                    ontap: () {
                      Get.toNamed(Routes.BANKING);
                    },
                  ),
                  20.verticalSpace,
                  CommonButton(
                    text: "Password input dialer",
                    ontap: () {
                      Get.to(
                        PasswordInputView(
                          expectedCode: '7412',
                          onSuccess: () {
                            // Handle Success Event here..
                          },
                          onError: () {
                            // Handle Error Event here..
                          },
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class NavigationBarButton extends StatelessWidget {
  final IconData iconData;
  final bool isSelected;
  final void Function() onTap;
  const NavigationBarButton({
    super.key,
    required this.iconData,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          height: 48,
          width: 48,
          color: isSelected ? AppColors.veryLightRed : null,
          child: Icon(iconData,
              size: 23,
              color: isSelected ? AppColors.darkRed : Colors.black),
        ),
      ),
    );
  }
}

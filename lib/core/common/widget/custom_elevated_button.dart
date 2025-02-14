import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/common/widget/customer_text.dart';
import 'package:flutter_tech_task/core/resources/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final bool isLoading;
  final String label;
  final Color labelColor, buttonColor;
  final double radius, height, width;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    super.key,
    required this.label,
    this.labelColor = Colors.white,
    this.buttonColor = AppColors.successColorSwatch,
    this.radius = 12,
    this.height = 40,
    this.width = double.infinity,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          disabledBackgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  key: Key("loader"),
                  width: 20,
                  height: 20,
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.white),
                ),
              )
            : CustomText(
                text: label,
                color: labelColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/resources/app_colors.dart';
import 'package:flutter_tech_task/core/resources/media_res.dart';
import 'package:lottie/lottie.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.blackTextColor),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Lottie.asset(MediaRes.pageUnderConstruction),
        ),
      ),
    );
  }
}

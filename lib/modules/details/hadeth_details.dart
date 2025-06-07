import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors/app_colors.dart';
import 'package:islami/modules/layout/screens/pages/hadeth_screen.dart';

class HadethDetails extends StatelessWidget {
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Hadith hadith = ModalRoute.of(context)!.settings.arguments as Hadith;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: Image.asset("assets/icons/left_icon.png")),
                        Expanded(
                          child: Text(
                            hadith.title,
                            style: TextStyle(
                              color: AppColors.prime,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(child: Image.asset("assets/icons/right_icon.png")),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        hadith.body,
                        style: TextStyle(
                          color: AppColors.prime,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/logo/mosque_logo.png",
                width: double.infinity,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors/app_colors.dart';
import 'package:islami/routes/app_routes.dart';
import 'package:islami/routes/app_routes_name.dart';

class SplashScreeen extends StatelessWidget {
  const SplashScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage("assets/backgrounds/Rectangle 1.png"),fit:BoxFit.fill )
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/backgrounds/Mosque-01 1.png"),
                FadeInDown(
                    duration: Duration(seconds: 1),
                    child: Image.asset("assets/backgrounds/Glow.png")),
              ],
            ),
            ZoomIn(
              duration: Duration(seconds: 1),
                child: SizedBox(
                    height: 400,
                    child: Image.asset("assets/logo/app_logo.png")),),

            FadeInUp(
              delay: Duration(seconds: 3),
                onFinish: (direction) {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutesName.home,(route)=>false);
                },
                child: Image.asset("assets/logo/route_logo.png")),
          ],
        ),
      ),

    );
  }
}

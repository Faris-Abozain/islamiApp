import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors/app_colors.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/backgrounds/time_bg.png"),
              fit: BoxFit.cover,

          )
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/logo/islami_logo.png",width: 300,),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                width: 380,
                decoration: BoxDecoration(color: AppColors.prime,borderRadius: BorderRadius.circular(30),),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text("azkar",style: TextStyle(color: Colors.white),)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 200,
                  width: 170,
                  decoration: BoxDecoration(color: AppColors.black,borderRadius: BorderRadius.circular(20),border: Border.all(color: AppColors.prime)),
                  child: Column(
                    children: [
                      Image.asset("assets/logo/evening_logo.png",height: 165,),
                      Text("Evening Azkar",style: TextStyle(fontSize: 16,color:Colors.white,fontWeight: FontWeight.w700),)
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: 180,
                  decoration: BoxDecoration(color: AppColors.black,borderRadius: BorderRadius.circular(20),border: Border.all(color: AppColors.prime)),
                  child: Column(
                    children: [
                      Image.asset("assets/logo/morning"
                          "_logo.png",height: 165,),
                      Text("Morning Azkar",style: TextStyle(fontSize: 16,color:Colors.white,fontWeight: FontWeight.w700),)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

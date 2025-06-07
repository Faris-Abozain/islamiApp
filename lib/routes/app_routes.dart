import 'package:flutter/material.dart';
import 'package:islami/modules/details/hadeth_details.dart';
import 'package:islami/modules/details/quran_details.dart';
import 'package:islami/modules/layout/screens/home_screen.dart';
import 'package:islami/modules/splash/splash_screen.dart';
import 'package:islami/routes/app_routes_name.dart';

class AppRoutes{
   static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutesName.splash:(_)=>SplashScreeen(),
     AppRoutesName.home:(_)=>HomeScreen(),
     AppRoutesName.QuranDetails:(_)=>QuranDetails(),
     AppRoutesName.hadeathDetails:(_)=>HadethDetails(),

  } ;
}
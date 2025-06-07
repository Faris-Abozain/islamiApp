import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/theme/app_colors/app_colors.dart';
import 'package:islami/modules/layout/screens/pages/hadeth_screen.dart';
import 'package:islami/modules/layout/screens/pages/quran_screen.dart';
import 'package:islami/modules/layout/screens/pages/radio_screen.dart';
import 'package:islami/modules/layout/screens/pages/sebha_screen.dart';
import 'package:islami/modules/layout/screens/pages/time_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem=0;
  List<Widget>screens=[
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedItem],
   bottomNavigationBar:BottomNavigationBar(
     currentIndex: selectedItem,
     onTap: (index){
       selectedItem=index;
       setState(() {});
     },
     backgroundColor: AppColors.prime,
     type: BottomNavigationBarType.fixed,
     unselectedItemColor: Colors.black,
     selectedItemColor: Colors.white,
     showUnselectedLabels: false,
     items: [
     customBtnIcon(icon: "quran.svg", label: "Quran"),
       customBtnIcon(icon: "hadeth.svg", label: "Hadeth"),
       customBtnIcon(icon: "sebha.svg", label: "Sebha"),
       customBtnIcon(icon: "radio.svg", label: "Radio"),
       customBtnIcon(icon: "time.svg", label: "Time"),
    ]
     ),


   );
  }

  BottomNavigationBarItem customBtnIcon({required String icon,required String label}){
    return  BottomNavigationBarItem(icon:SvgPicture.asset("assets/icons/$icon",color: AppColors.black,) ,label:label,
      activeIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: AppColors.black.withOpacity(.6),
          ),
          child: FadeIn(child: SvgPicture.asset("assets/icons/$icon",color: Colors.white))) ,



    );
}
}

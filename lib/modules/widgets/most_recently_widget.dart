import 'package:flutter/material.dart';
import 'package:islami/core/models/sura_data.dart';
import 'package:islami/routes/app_routes_name.dart';

import '../../core/theme/app_colors/app_colors.dart';

class MostRecentlyWidget extends StatelessWidget {
  final SuraData data;
   const MostRecentlyWidget({super.key,required this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap:(){ Navigator.pushNamed(context,AppRoutesName.QuranDetails,arguments: data);},
        child: Container(
          height:150 ,
          width: 300,
          decoration: BoxDecoration(
              color: AppColors.prime,
              borderRadius: BorderRadius.circular(22)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(data.suraNameEn,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text(data.suraNameAr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    Text("${data.verses} Verses",style: TextStyle(fontSize: 18))

                  ],
                ),
              ),
              Image.asset("assets/logo/recently_logo.png")
            ],
          ),
        ),
      ),
    );
  }
}

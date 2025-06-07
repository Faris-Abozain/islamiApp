import 'package:flutter/material.dart';
import 'package:islami/core/models/sura_data.dart';
import 'package:islami/routes/app_routes_name.dart';

class SuraCard extends StatelessWidget {
  final SuraData suraData;
  final void Function(SuraData)onTap;
   SuraCard({super.key,required this.suraData,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        onTap(suraData);
        Navigator.pushNamed(context,AppRoutesName.QuranDetails,arguments: suraData);},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height:60,
              width: 60,
              decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage("assets/icons/aya_container.png"))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(child: Text("${suraData.suraNumber}".toString(),style: TextStyle(fontSize: 15,color: Colors.white),)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(suraData.suraNameEn,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                Text("${suraData.verses}"" Verses",style: TextStyle(color: Colors.white,fontSize: 15))
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Text(suraData.suraNameAr,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}

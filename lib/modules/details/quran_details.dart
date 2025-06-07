import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/models/sura_data.dart';
import 'package:islami/core/theme/app_colors/app_colors.dart';

class QuranDetails extends StatefulWidget {
   QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
List<String>verses=[];

  @override
  Widget build(BuildContext context) {
    SuraData suraData=ModalRoute.of(context)!.settings.arguments as SuraData;
    if(verses.isEmpty){
      readFile(suraData.suraNumber);
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text(suraData.suraNameEn,style: TextStyle(color: AppColors.prime,fontSize: 30,fontWeight: FontWeight.bold),),
        ),
        iconTheme: IconThemeData(color: AppColors.prime),

      ),
      body: Column(
        children: [
          Row(
              textDirection: TextDirection.ltr,
            children: [
              Image.asset("assets/icons/left_icon.png"),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: SizedBox(
                    width: 165,
                    child: Text(suraData.suraNameAr,style: const TextStyle(color: AppColors.prime,fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
               Image.asset("assets/icons/right_icon.png")
            ],

          ),
          Expanded(
            child: ListView(
              children:[ Text.rich(TextSpan(
                children:
                verses.map((e) {
                  int index=verses.indexOf(e);
                  return TextSpan(
                  text: e+" [${index+1}]",
                    style: TextStyle(color: AppColors.prime,fontSize: 20),
            
                  );
                },).toList()
              ),
              textDirection: TextDirection.rtl,
              ),
                ]
            ),
          ),
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/logo/mosque_logo.png"))
            ),
          )
        ],
      ),
    );
  }

  void readFile(String id)async{
    String data= await rootBundle.loadString("assets/Suras/$id.txt");
    data=data.trim();
    verses=data.split("\n");
    setState(() {
    });
  }
}

import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double angle=0;
  int counter=0;
  int index=0;
  List<String> azkar=[
    "سبحان الله",
    "الحمدلله",
    "لا اله الا الله",
    "الله اكبر",
    "استغفر الله"
  ];
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/backgrounds/sebha_bg.png"),
              fit: BoxFit.cover
          )
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/logo/islami_logo.png",width: 300,),
            SizedBox(height: 20,),
            Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى",style: TextStyle(fontSize: 36,fontWeight: FontWeight.w700,color: Colors.white),),
            SizedBox(height: 40,),
            InkWell(
              onTap: () => onTapClick(),
              child: Container(
                height: 320,
                width: 310,
                child: Center(
                    child: Column(

                  children: [
                    Stack(
                        children:[ Transform.rotate(
                            angle: angle,
                            child: Image.asset("assets/icons/SebhaBody 1.png")),
                         Column(

                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 80,top: 100),
                               child: Text(azkar[index],style: TextStyle(color: Colors.white,fontSize: 36,fontWeight: FontWeight.w700),),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left: 100,),
                               child: Text(counter.toString(),style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w700)),
                             )
                           ],
                         )

                        ]),
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
  void onTapClick(){
    angle+=10;
    counter++;
    if(counter==33){
      counter=0;
      if(index==azkar.length-1){
        index=0;
      }
      index++;
    }
    setState(() {

    });
  }
}

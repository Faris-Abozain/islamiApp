import 'package:flutter/material.dart';
import 'package:islami/core/constant/quran_helper.dart';
import 'package:islami/core/models/sura_data.dart';
import 'package:islami/core/theme/app_colors/app_colors.dart';
import 'package:islami/modules/widgets/most_recently_widget.dart';
import 'package:islami/modules/widgets/sura_card.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<SuraData> mostRecently = [];

List<SuraData> searchData = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/backgrounds/quran_bg.png"),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/logo/islami_logo.png",
              width: 300,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              style: TextStyle(fontSize: 16,color: Colors.white),
              cursorColor: AppColors.prime,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: AppColors.prime,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColors.prime,
                  ),
                ),
                prefixIcon: ImageIcon(
                  AssetImage("assets/icons/search_icon.png"),
                  color: AppColors.prime,
                ),
                hintText: "Sura Name",
                hintStyle: TextStyle(color: Colors.white),
              ),
              onChanged: (value) {
                search(value);
              },
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
                width: 600,
                child: Text(
                  "most recently",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: mostRecently.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MostRecentlyWidget(
                      data: SuraData(
                        suraNumber: (index + 1).toString(),
                        suraNameAr: QuranHelper.suraNameAr[index],
                        suraNameEn: QuranHelper.suraNameEn[index],
                        verses: QuranHelper.suraVerses[index],
                      ));
                },
              ),
            ),
            //search
            searchData.isEmpty ?Expanded(
              child: ListView.separated(
                itemCount: 114,
                itemBuilder: (context, index) {
                  return SuraCard(
                    suraData: SuraData(
                      suraNumber: (index + 1).toString(),
                      suraNameAr: QuranHelper.suraNameAr[index],
                      suraNameEn: QuranHelper.suraNameEn[index],
                      verses: QuranHelper.suraVerses[index],
                    ), onTap: (data) {
                    saveSura(data);
                  },);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    endIndent: 30,
                    indent: 30,
                  );
                },
              ),
            ):
            Expanded(
              child: ListView.separated(
                itemCount: searchData.length,
                itemBuilder: (context, index) {
                  return SuraCard(
                    suraData: SuraData(
                      suraNumber: searchData[index].suraNumber,
                      suraNameAr: searchData[index].suraNameAr,
                      suraNameEn: searchData[index].suraNameEn,
                      verses: searchData[index].verses,
                    ), onTap: (data) {
                    saveSura(data);
                  },);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    endIndent: 30,
                    indent: 30,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveSura(SuraData data) {
    mostRecently.insert(0, data);
    mostRecently = mostRecently.toSet().toList();
    setState(() {});
  }
  void search(String value){
    searchData=[];
    QuranHelper.suraNameEn.where((element) {
      if(element.toLowerCase().contains(value)){
        int index=QuranHelper.suraNameEn.indexOf(element);
        searchData.add(SuraData(
            suraNumber: (index + 1).toString(),
            suraNameAr: QuranHelper.suraNameAr[index],
            suraNameEn: QuranHelper.suraNameEn[index],
            verses: QuranHelper.suraVerses[index]));
      }
      return true;
    },).toList();
    setState(() {

    });
  }
}

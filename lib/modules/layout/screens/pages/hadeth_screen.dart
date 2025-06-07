import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/theme/app_colors/app_colors.dart';
import 'package:islami/routes/app_routes_name.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<Hadith> ahadeath = [];

  @override
  void initState() {
    super.initState();
    readAhadith();
  }

  Future<void> readAhadith() async {
    List<Hadith> loadedAhadith = [];

    for (int i = 1; i <= 50; i++) {
      try {
        String fileContent = await rootBundle.loadString('assets/Hadeeth/h$i.txt');
        List<String> lines = fileContent.split('\n');
        lines.removeWhere((line) => line.trim().isEmpty);

        if (lines.isNotEmpty) {
          String title = lines.first.trim();
          String body = lines.sublist(1).join('\n').trim();
          loadedAhadith.add(Hadith(title, body));
        }
      } catch (e) {
        print('Error reading file $i.txt: $e');
      }
    }

    setState(() {
      ahadeath = loadedAhadith;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backgrounds/hadeth_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/logo/islami_logo.png",
              width: 300,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ahadeath.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : CarouselSlider.builder(
                itemCount: ahadeath.length,
                options: CarouselOptions(
                  height: 480.0,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIndex) {
                  final hadith = ahadeath[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutesName.hadeathDetails,
                        arguments: hadith,
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.prime,
                        borderRadius: BorderRadiusDirectional.circular(16),
                      ),
                      child: Stack(
                        children: [
                          // الزخارف الجانبية
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Image.asset(
                              "assets/icons/left_icon.png",
                              width: 40,
                              height: 40,
                              color: AppColors.black,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Image.asset(
                              "assets/icons/right_icon.png",
                              width: 40,
                              height: 40,
                              color: AppColors.black,
                            ),
                          ),
                          // محتوى الحديث
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  hadith.title,
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 20),
                                Expanded(
                                  child: Text(
                                    hadith.body,
                                    style: TextStyle(fontSize: 18),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Hadith {
  final String title;
  final String body;

  Hadith(this.title, this.body);
}
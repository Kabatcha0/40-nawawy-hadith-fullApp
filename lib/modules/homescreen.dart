import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hadith/component/component.dart';
import 'package:hadith/modules/listenhadith.dart';
import 'package:hadith/modules/readahadih.dart';
import 'package:hadith/shared/style/color.dart';
import 'package:hadith/shared/style/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: headerBackgoundColor,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/Group.svg",
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                alignment: Alignment.center,
                                "assets/svg/Groupicon.svg",
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: title,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: header,
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    card(
                        context: context,
                        widget: ReadAhadih(),
                        text: titleOfCardOne,
                        svgImage: "assets/svg/Groupc.svg",
                        pngImage: "assets/png/quran.png",
                        colorOne: cardOne,
                        colorTwo: cardOne_),
                    const SizedBox(
                      height: 20,
                    ),
                    card(
                        context: context,
                        widget: ListenHadith(),
                        padding: true,
                        text: titleOfCardTwo,
                        svgImage: "assets/svg/Groupc2.svg",
                        pngImage: "assets/png/play.png",
                        colorOne: cardTwo,
                        colorTwo: cardTwo_),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // card(
                    //     context: context,
                    //     widget: ListenHadith(),
                    //     text: titleOfCardThree,
                    //     svgImage: "assets/svg/Groupc3.svg",
                    //     pngImage: "assets/png/save-instagram.png",
                    //     colorOne: cardThree,
                    //     colorTwo: cardThree_),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

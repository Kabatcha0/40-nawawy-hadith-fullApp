import 'package:flutter/material.dart';
import 'package:hadith/cubit/cubit/cubit.dart';
import 'package:hadith/cubit/states/states.dart';
import 'package:hadith/modules/detailofread.dart';
import 'package:hadith/shared/style/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadith/shared/style/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadAhadih extends StatelessWidget {
  const ReadAhadih({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HadithCubit, HadithStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HadithCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: Column(children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 19.0),
                  child: Container(
                    color: headerBackgoundColor,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/Group.svg",
                          fit: BoxFit.cover,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                          Icons.arrow_back_ios_rounded)),
                                  SvgPicture.asset(
                                    alignment: Alignment.center,
                                    "assets/svg/Groupicon.svg",
                                    fit: BoxFit.cover,
                                  ),
                                  const Text("")
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: headerPageTwo,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    cubit.splitText(index: index);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailOfRead(
                                split: cubit.split.first,
                                hadith: cubit.hadiths,
                                index: index)));
                  },
                  child: Container(
                    child: Stack(alignment: Alignment.center, children: [
                      Image.asset(
                        "assets/png/star.png",
                        height: 190,
                      ),
                      SvgPicture.asset(
                        "assets/svg/star.svg",
                        height: 195,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cubit.listhadiths[index].key,
                            style: GoogleFonts.tajawal(
                                color: const Color(0xffFFD434),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            width: 150,
                            child: Center(
                              child: Text(
                                cubit.listhadiths[index].nameHadith,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tajawal(
                                    color: const Color(0xffFFD434),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                itemCount: cubit.listhadiths.length,
              ),
            )
          ])),
        );
      },
    );
  }
}

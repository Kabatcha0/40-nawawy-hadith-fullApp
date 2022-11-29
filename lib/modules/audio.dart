import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hadith/cubit/cubit/cubit.dart';
import 'package:hadith/cubit/states/states.dart';
import 'package:hadith/model/model.dart';
import 'package:hadith/modules/details.dart';
import 'package:hadith/modules/narrator.dart';
import 'package:hadith/shared/style/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Audio extends StatelessWidget {
  String title;
  String header;
  String audio;
  Audio({required this.title, required this.header, required this.audio});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HadithCubit()
        ..initAudio(audio: audio)
        ..tallOfAudio()
        ..onChangePosition(),
      child: BlocConsumer<HadithCubit, HadithStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HadithCubit.get(context);
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Column(children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        color: headerBackgoundColor,
                        child: Stack(children: [
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
                                            cubit.dispose();

                                            cubit.play = false;
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
                                Text(
                                  header,
                                  style: GoogleFonts.tajawal(
                                      color: backgroundSplash,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 286,
                                            height: 267,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: SvgPicture.asset(
                                                "assets/svg/audio.svg"),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                title,
                                                style: GoogleFonts.tajawal(
                                                    fontSize: 16,
                                                    color: titleColor),
                                              ),
                                              Text(
                                                header,
                                                style: GoogleFonts.tajawal(
                                                    fontSize: 24,
                                                    color: backgroundSplash,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${cubit.value.inMinutes.remainder(60)} : ${cubit.value.inSeconds.remainder(60)}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: cardTwo),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Slider(
                                              activeColor: cardTwo,
                                              inactiveColor: listen,
                                              max: cubit.length.inSeconds
                                                  .toDouble(),
                                              min: 0,
                                              value: cubit.value.inSeconds
                                                  .toDouble(),
                                              onChanged: (v) {
                                                cubit.seekSlider(s: v.round());
                                              }),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "${cubit.length.inMinutes.remainder(60)} : ${cubit.length.inSeconds.remainder(60)}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: cardTwo),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                cubit.seekAudioMinus();
                                              },
                                              icon: const Icon(
                                                Icons.arrow_back_ios_rounded,
                                                size: 35,
                                                color: titleColor,
                                              )),
                                          const SizedBox(
                                            width: 81.5,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                if (cubit.play == false) {
                                                  cubit.playAudio();
                                                } else {
                                                  cubit.pauseAudio();
                                                }
                                              },
                                              icon: cubit.play
                                                  ? const Icon(
                                                      Icons.pause,
                                                      size: 35,
                                                      color: titleColor,
                                                    )
                                                  : const Icon(
                                                      Icons.play_arrow,
                                                      size: 35,
                                                      color: titleColor,
                                                    )),
                                          const SizedBox(
                                            width: 81.5,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                cubit.seekAudioPlus();
                                              },
                                              icon: const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 35,
                                                color: titleColor,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ])
                        ]))),
              ]),
            )),
            floatingActionButton: FloatingActionButton(
              backgroundColor: cardTwo,
              onPressed: () {
                cubit.muteAudio();
              },
              child: cubit.mute
                  ? const Icon(Icons.volume_off_sharp)
                  : const Icon(Icons.volume_up_sharp),
            ),
          );
        },
      ),
    );
  }
}

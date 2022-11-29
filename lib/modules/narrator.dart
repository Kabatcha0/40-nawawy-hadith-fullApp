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

class Narrator extends StatelessWidget {
  String? split;
  Narrator({required this.split});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HadithCubit, HadithStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: Column(children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.only(top: 19.0),
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
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                              Icons.arrow_back_ios_rounded)),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              alignment: Alignment.center,
                                              "assets/svg/Groupicon.svg",
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ])
                        ])))),
            Expanded(
                flex: 5,
                child: RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(121, 85, 72, 1)),
                        children: [TextSpan(text: split)])))
          ])),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              Share.share(split!, subject: split);
            },
            tooltip: "share",
            child: const Icon(Icons.share),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        );
      },
    );
  }
}

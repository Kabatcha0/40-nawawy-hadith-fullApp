import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hadith/modules/readahadih.dart';

Widget card(
    {required Text text,
    required String svgImage,
    required String pngImage,
    required Color colorOne,
    required Color colorTwo,
    required BuildContext context,
    required Widget widget,
    bool padding = false}) {
  return CupertinoButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
              colors: [colorOne, colorTwo],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd)),
      width: 600,
      height: 120,
      child: padding == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Image.asset(pngImage),
                ),
                text,
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(svgImage),
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(pngImage),
                text,
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(svgImage),
                )
              ],
            ),
    ),
  );
}

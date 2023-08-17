import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/character/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key, required this.character});
  final Character character;
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 460.h,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name!,
          style: const TextStyle(color: Colors.white60),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.id as int,
          child: Image.network(
            character.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis, //...
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: TextStyle(
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp)),
          TextSpan(
              text: value,
              style: TextStyle(color: MyColors.myWhite, fontSize: 16.sp))
        ]));
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: Colors.yellow,
      height: 30,
      endIndent: endIndent.h,
      thickness: 2,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('Id :', '${character.id}'),
                  buildDivider(285.w),
                  characterInfo('Name :', character.name!),
                  buildDivider(230.w),
                  characterInfo('Gender :', character.gender!),
                  buildDivider(320.w),
                  characterInfo('Status :', character.status!),
                  buildDivider(320.h),
                  characterInfo('Species :', character.species!),
                  buildDivider(320.h),
                  Center(
                    child: SizedBox(
                      width: 250.0,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 30.0.sp,
                          fontFamily: 'Agne',
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                                'Characters Application Done By :  Nasser Yazgi'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 500,
            )
          ]))
        ],
      ),
    );
  }
}

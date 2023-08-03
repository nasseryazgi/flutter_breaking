import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/colors.dart';

import '../../data/models/character/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key, required this.character});
  final Character character;
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 500, // lenght of picter
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
          child: Image.network(character.image! ,fit: BoxFit.cover,),
          
        ),
      ),
    );
  }
 Widget characterInfo(String title , String value){
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis, //...
        text: TextSpan(
          children: [
           TextSpan(
             text: title,
             style: const TextStyle(
               color: MyColors.myWhite,fontWeight: FontWeight.bold,
               fontSize: 18
             )
           ) ,
            TextSpan(
                text: value,
                style: const TextStyle(
                    color: MyColors.myWhite,
                    fontSize: 16
                )
            )
          ]
        ));

 }

 Widget buildDivider(double endIndent){
    return  Divider(
color: Colors.yellow,
      height: 30,
      endIndent:endIndent ,
      thickness: 2,
    );
 }
  Widget build(BuildContext context) {
    return 
      Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
           buildSliverAppBar(),
          SliverList(delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('Id :' ,'${character.id}'),
                    buildDivider(350),
                    characterInfo('Name :' ,character.name!),
                    buildDivider(320),
                    characterInfo('Gender :' ,character.gender!),
                    buildDivider(320),
                    characterInfo('Status :' ,character.status!),
                    buildDivider(320),
                    characterInfo('Species :' ,character.species!),
                    buildDivider(320) ,
                    SizedBox(height: 20,)
                  ],
                ),
              ),
              SizedBox(height: 300,)

            ]
          ))
        ],
      ),
    );
  }
}

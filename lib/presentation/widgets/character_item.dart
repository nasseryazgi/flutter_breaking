import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breaking/constants/colors.dart';

import '../../data/models/character/character.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({Key? key, required this.character}) : super(key: key);
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            character.name!,
            style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
            color: MyColors.myGrey,
            child: character.image!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/loading.gif',
                    image: character.image!)
                : const CircularProgressIndicator()),
      ),
    );
  }
}

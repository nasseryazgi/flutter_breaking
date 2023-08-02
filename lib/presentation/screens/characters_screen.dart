import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/cubit/character_cubit.dart';
import 'package:flutter_breaking/constants/colors.dart';
import 'package:flutter_breaking/presentation/widgets/character_item.dart';

import '../../data/models/character/character.dart';
import '../widgets/show_loading_indicator.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> characterList;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Text(
          'Characters',
          style: TextStyle(color: MyColors.myGrey),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoaded) {
             characterList = (state).characterlist;
            return SingleChildScrollView(
              child: Container(
                color: MyColors.myGrey,
                child: Column(
                  children: [
                    GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                        ),
                        shrinkWrap: true,
                        itemCount: state.characterlist.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CharacterItem(
                              character: state.characterlist[index]);
                        }),
                  ],
                ),
              ),
            );
          } else {
            return const ShowLoadingIndicator();
          }
        },
      ),
    );
  }
}

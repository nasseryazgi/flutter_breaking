import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/cubit/character_cubit.dart';
import 'package:flutter_breaking/constants/colors.dart';
import 'package:flutter_breaking/presentation/widgets/character_item.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/character/character.dart';
import '../widgets/show_loading_indicator.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  late List<Character> searchedForCharacter;
  bool isSearching = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: textEditingController,
      cursorColor: MyColors.myGrey,
      style: const TextStyle(color: MyColors.myGrey, fontSize: 18),
      decoration: const InputDecoration(
        hintText: 'Find a Character ..',
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      onChanged: (searchedCharacter) {
        addSearchedForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacter = allCharacters
        .where((element) =>
            element.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: MyColors.myGrey,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: _startedSearching,
            icon: const Icon(
              Icons.search,
              color: MyColors.myGrey,
            ))
      ];
    }
  }

  void _startedSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      textEditingController.clear();
    });
  }

  Widget _BuildAppBarTitle() {
    return const Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myYellow,
          title: isSearching ? _buildSearchTextField() : _BuildAppBarTitle(),
          actions: _buildAppBarActions(),
          leading: isSearching
              ? const BackButton(color: MyColors.myGrey)
              : Container(),
          // leading: _isSearch ?,
          centerTitle: true,
        ),
        body: OfflineBuilder(
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return BlocBuilder<CharacterCubit, CharacterState>(
                builder: (context, state) {
                  if (state is CharacterLoaded) {
                    allCharacters = (state).characterlist;
                    return SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 3,
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
                                itemCount: textEditingController.text.isEmpty
                                    ? allCharacters.length
                                    : searchedForCharacter.length,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return CharacterItem(
                                      character:
                                          textEditingController.text.isEmpty
                                              ? allCharacters[index]
                                              : searchedForCharacter[index]);
                                }),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const ShowLoadingIndicator();
                  }
                },
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    ' turn off your internet.',
                    style: TextStyle(fontSize: 22.sp, color: MyColors.myGrey),
                  ),
                  Image.asset('assets/images/no_internet.png')
                ],
              );
            }
          },
          child: const ShowLoadingIndicator(),
        ));
  }
}

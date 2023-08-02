import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/cubit/character_cubit.dart';
import 'package:flutter_breaking/constants/strings.dart';
import 'package:flutter_breaking/data/repository/characters_repository.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';
import 'package:flutter_breaking/presentation/screens/character_details_screen.dart';
import 'package:flutter_breaking/presentation/screens/characters_screen.dart';

class AppRouter {
  Route? generatRouter(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CharacterCubit(CharacterRepoitory(
                      characterWebServies: CharacterWebServies())),
                  child: const CharactersScreen(),

                ));

      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
    }
  }
}

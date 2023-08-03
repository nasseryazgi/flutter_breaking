import 'package:flutter/material.dart';
import 'package:flutter_breaking/app_router.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';

import 'data/repository/characters_repository.dart';

void main() {
  runApp(BreakingBadApp(
    appRouter: AppRouter(),
  ));

}

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generatRouter,
    );
  }
}




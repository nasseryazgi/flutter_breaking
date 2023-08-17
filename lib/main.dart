import 'package:flutter/material.dart';
import 'package:flutter_breaking/app_router.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generatRouter,
        );
      },
    );
  }
}

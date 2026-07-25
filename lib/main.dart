import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_characters/core/route_manager/generate_routes.dart';
import 'package:rick_and_morty_characters/features/characters/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      builder: (context, child) {
        return  MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter
        );
      },
    );
  }
}



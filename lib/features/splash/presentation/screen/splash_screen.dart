import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_characters/core/constants/app_colors.dart';
import 'package:rick_and_morty_characters/core/route_manager/routes_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      context.go(RoutesNames.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Center(child: Image.asset("assets/images/logo.png", width: 300.w)),
            Positioned(
              left: 0,
              right: 0,
              bottom: 40.h,
              child: Column(
                children: [
                  SizedBox(
                    width: 28.w,
                    height: 28.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 12.h),
                  Text(
                    "Loading...",
                    style: GoogleFonts.poppins(
                      color: AppColors.textMuted,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

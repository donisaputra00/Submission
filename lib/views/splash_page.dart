import 'dart:async';

import 'package:flutter/material.dart';

import '../preferences/preferences.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () =>
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false),
    );
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AssetPath.logo,
                  ),
                ),
              ),
            ),
            Text(
              'GAAMETIIME',
              style: AppTexStyle.title.copyWith(
                color: AppColors.lightColor,
              ),
            ),
            Text(
              'CONNECT WITH YOUR REALITY',
              style: AppTexStyle.desc.copyWith(
                color: AppColors.lightColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

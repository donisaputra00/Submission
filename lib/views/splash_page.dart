import 'dart:async';

import 'package:flutter/material.dart';

import '../preferences/preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    if (mounted) {
      getInit();
      super.initState();
    }
  }

  getInit() async {
    Timer(
      const Duration(seconds: 3),
      () =>
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
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

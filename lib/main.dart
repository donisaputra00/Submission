import 'package:flutter/material.dart';

import 'views/views.dart';

void main() => runApp(const MainPage());

class MainPage extends StatelessWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/main': (context) => const OnBoardPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}

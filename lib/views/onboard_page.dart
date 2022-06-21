import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:submission/preferences/preferences.dart';
import 'package:submission/sections/sections.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  final List<SliderData> dataSlider = [
    const SliderData(
      id: 1,
      image: AssetPath.illOnboard1,
      title: 'Get Paid! Playing Video Game',
      desc:
          'Earn points and real cash when you win a battle with no delay in cashing out',
    ),
    const SliderData(
      id: 2,
      image: AssetPath.illOnboard2,
      title: 'Schedule Games With Friends',
      desc:
          'Easily create an upcoming event and get ready for battle. Yeah! real combat fella.',
    ),
    const SliderData(
      id: 3,
      image: AssetPath.illOnboard3,
      title: 'Text, Audio and Video Chat',
      desc:
          'Intuitive real life experience on mobile. Chat with fellow gamers before and after combat for free!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(dataSlider),
    );
  }

  Widget _buildBody(List<SliderData> data) {
    return SliderSection(
      maxLengthIndex: dataSlider.length - 1,
      onComplete: () {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      },
      onNext: () {
        _controller.nextPage();
      },
      controller: _controller,
      onChange: (v) {
        setState(() {
          _currentIndex = v;
        });
      },
      currentIndex: _currentIndex,
      data: data,
    );
  }
}

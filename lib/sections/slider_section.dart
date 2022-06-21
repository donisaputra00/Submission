import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:submission/sections/sections.dart';

import '../preferences/preferences.dart';

class SliderSection extends StatelessWidget {
  final CarouselController controller;
  final ValueChanged<int> onChange;
  final int currentIndex;
  final int maxLengthIndex;
  final List<SliderData> data;
  final VoidCallback? onNext;
  final VoidCallback? onComplete;

  const SliderSection({
    Key? key,
    required this.controller,
    required this.onChange,
    required this.currentIndex,
    required this.data,
    required this.maxLengthIndex,
    this.onNext,
    this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CarouselSlider.builder(
          itemCount: data.length,
          itemBuilder: (_, i, opt) => _buildItemView(context, data[i]),
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            viewportFraction: 1,
            aspectRatio: 1,
            enableInfiniteScroll: false,
            initialPage: 0,
            onPageChanged: (index, reason) {
              onChange(index);
            },
            height: Dimens.height(context) / 1.4,
          ),
          carouselController: controller,
        ),
        (currentIndex == maxLengthIndex)
            ? CustomButton(
                text: 'Let’s Combat!',
                bgColor: AppColors.primaryColor,
                onTap: onComplete,
                style: AppTexStyle.button.copyWith(color: AppColors.lightColor),
              )
            : CustomButton(
                text: 'Skip',
                bgColor: AppColors.lightColor,
                onTap: onNext,
                style: AppTexStyle.button,
              ),
        _buildIndicator(context),
      ],
    );
  }

  Widget _buildItemView(BuildContext context, SliderData data) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: Dimens.height(context) * 0.35,
            child: Image.asset(
              data.image,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data.title,
                    style: AppTexStyle.title,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.desc,
                    textAlign: TextAlign.center,
                    style: AppTexStyle.desc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIndicator(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: data.map((data) {
        var isActive = (currentIndex + 1) == data.id;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: isActive
                ? AppColors.primaryColor
                : AppColors.disabledColor.withOpacity(0.3),
          ),
        );
      }).toList(),
    );
  }
}

class SliderData {
  final int id;
  final String image;
  final String title;
  final String desc;

  const SliderData({
    required this.id,
    required this.image,
    required this.title,
    required this.desc,
  });
}

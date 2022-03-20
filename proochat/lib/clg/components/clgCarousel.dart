import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:proochat/infoconstant.dart';
import 'collegeCard.dart';
import 'package:proochat/courses.dart';

class CollegeCarousel extends StatefulWidget {
  final List<dynamic> pass;
  CollegeCarousel({Key? key, required this.pass}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CollegeCarouselState(this.pass);
  }
}

class _CollegeCarouselState extends State<CollegeCarousel> {
  List<dynamic> pass;
  _CollegeCarouselState(this.pass);
  PageController? _pageController;
  int initialPage = 1;
  College clg = College();
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: pass.length,
          itemBuilder: (context, index) => buildSlider(index),
        ),
      ),
    );
  }

  Widget buildSlider(int index) => AnimatedBuilder(
        animation: _pageController!,
        builder: (context, child) {
          double value = 0;
          if (_pageController!.position.haveDimensions) {
            value = index - _pageController!.page!;
            // We use 0.038 because 180*0.038 = 7 almost and we need to rotate our poster 7 degree
            // we use clamp so that our value vary from -1 to 1
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(
                q: pass[index],
              ),
            ),
          );
        },
      );
}

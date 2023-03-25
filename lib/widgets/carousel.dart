import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarousel extends StatelessWidget {
  MyCarousel({super.key});

  final List<String> items = [
    'images/Carousel1.jpeg',
    'images/Carousel2.webp',
    'images/Carousel3.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items.map((item) {
        return Container(
          child: Center(
            child: Image(
              image: AssetImage(item),
              fit: BoxFit.fitWidth,
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.95,
      ),
    );
  }
}

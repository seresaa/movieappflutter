// ignore: file_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/constants.dart';
import 'package:movieapp/details_screen.dart';



class TrendMoviesSlider extends StatelessWidget {
  const TrendMoviesSlider({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     width: double.infinity,
     child: CarouselSlider.builder(
      itemCount: snapshot.data!.length,
       options: CarouselOptions(
        height: 300,
        autoPlay: true,
        viewportFraction: 0.55,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        enlargeCenterPage: true,
        pageSnapping: true,
      ),
      // ignore: non_constant_identifier_names
      itemBuilder: (context, itemIndex, PageViewIndex){
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Details_Screen(movie: snapshot.data[itemIndex],)));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 300,
              width: 200,
            child: Image.network(
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}'
            ),
            ),
          ),
        );
      },
     
      ),
    );
  }
}
import 'package:flutter/material.dart';
class MovieDetailsText extends StatelessWidget {
    final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieDetailsText(this.movie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(movie['original_title']),
      ),
    );
  }
}
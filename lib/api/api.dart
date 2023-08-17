import 'package:movieapp/models/moviemodel.dart';
import '../constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api{
  static const trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const upcomingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  Future <List<Movie>> getTrendingMovies() async {
    final response =  await http.get(Uri.parse(trendingUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List; 
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('oops, something happenend');
    }
  }

  Future <List<Movie>> getTopRatedMovies() async {
    final response =  await http.get(Uri.parse(topRatedUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List; 
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('oops, something happenend');
    }
  }

  Future <List<Movie>> getUpcomingMovies() async {
    final response =  await http.get(Uri.parse(upcomingUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List; 
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else{
      throw Exception('oops, something happenend');
    }
  }
}
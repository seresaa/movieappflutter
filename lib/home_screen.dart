
import 'package:flutter/material.dart';
import 'package:movieapp/api/api.dart';

import 'package:movieapp/widgets/trendsSlider.dart';
import 'package:movieapp/widgets/movies_slider.dart';

import 'models/moviemodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

late Future<List<Movie>> trendingMovies;
late Future<List<Movie>> topRatedMovies;
late Future<List<Movie>> upcomingMovies;

@override
void initState() {
  super.initState();
  trendingMovies = Api().getTrendingMovies(); 
  topRatedMovies = Api().getTopRatedMovies();
  upcomingMovies = Api().getUpcomingMovies();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
     backgroundColor: Colors.transparent,  
     elevation: 0,
     title: Image.asset('assets/images/logo-moviemania.png',
     fit: BoxFit.cover,
     height: 50,
     filterQuality: FilterQuality.high,
     ),
    centerTitle: true,
     ),
     body:  SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Trending Movies", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
             SizedBox(
              child: FutureBuilder(
              future: trendingMovies,
              builder: (context, snapshot){
                if (snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),
                  );
                }else if(snapshot.hasData){
                  return TrendMoviesSlider(snapshot: snapshot,);
                }else{
                  return SizedBox(child: CircularProgressIndicator());
                }
              },
              ),
            ),
            SizedBox(height: 16),
            Text("Top rated movies",
             style: TextStyle(fontSize: 16) ,
             ),
             SizedBox(height: 32),
             SizedBox(
              child: FutureBuilder(
              future: topRatedMovies,
              builder: (context, snapshot){
                if (snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),
                  );
                }else if(snapshot.hasData){
                  return MoviesSlider(snapshot: snapshot,);
                }else{
                  return SizedBox(child: CircularProgressIndicator());
                }
              },
              ),
            ),
              Text("Upcoming movies",
             style: TextStyle(fontSize: 16) ,
             ),
              SizedBox(height: 32),
            SizedBox(
              child: FutureBuilder(
              future: upcomingMovies,
              builder: (context, snapshot){
                if (snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),
                  );
                }else if(snapshot.hasData){
                  return MoviesSlider(snapshot: snapshot,);
                }else{
                  return SizedBox(child: CircularProgressIndicator());
                }
              },
              ),
            ),

          ],
        ),
      ),
     ),
    );
  }
}




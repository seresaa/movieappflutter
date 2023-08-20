import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/colorpallete.dart';
import 'constants.dart';
import 'models/moviemodel.dart';

class Details_Screen extends StatelessWidget {
  const Details_Screen({
    super.key,
    required this.movie,});
  final Movie movie;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          leading: Container( 
            height: 70,
            width: 70,
            margin: const EdgeInsets.only(
              top: 16, 
              left: 16,
              ),
              decoration: BoxDecoration(
                color:  Colors.grey,
                borderRadius: BorderRadius.circular(8),

              ),
              child: IconButton(onPressed: (){
              Navigator.pop(context);
              }, 
              icon: const Icon(Icons.arrow_back)),
          ),
            backgroundColor: Colours.bgcolor,
            expandedHeight: 450,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
           background: ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
            child: Image.network('${Constants.imagePath}${movie.posterPath}',
            filterQuality: FilterQuality.high,
            fit: BoxFit.fitWidth,
            ),
          ),
        ),
          
        ),
         SliverToBoxAdapter(
          child: Padding(padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                    Icon(Icons.date_range),
                     Text(
                      'Release date: ' + movie.releaseDate,
                      style: GoogleFonts.workSans(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                   SizedBox(width: 40),
                   Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                     Text(movie.voteAverage.toString(),
                      style: GoogleFonts.workSans(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    ],
                  ),


                ],
              ),
              


              SizedBox(height: 25,),

              Text(
                'Synopsis',
               style: GoogleFonts.workSans(fontSize: 15, fontWeight: FontWeight.normal),
               ), 

               SizedBox(height: 17,),
               Text(movie.overview,
               style: GoogleFonts.workSans(fontSize: 13, fontWeight: FontWeight.normal),
               ), 
             ],
            ),
          ),
        )
      ],
     ),
    );
  }
}
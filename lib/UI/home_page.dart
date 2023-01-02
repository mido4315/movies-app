import 'package:flutter/material.dart';
import 'package:movie/Network/movie_api.dart';

import '../Models/highest_rated_movies_model.dart';
import '../Models/movie_model.dart';
import '../Network/highest_rated_movies_API.dart';
import 'favorite_page.dart';
import 'movie_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Movie>? movie;
  Future<HighestRatedMovies>? hrm;
  bool isItMovie = true;
  void x(){}
  String favorites = 'Favorites';
  String highestRated = 'Highest Rated';
  String mostPopular = 'Most Popular';
  bool isITMostPopular = true;

  @override
  void initState() {
    super.initState();
    movie = MovieAPI().fetchMovie();
    hrm = HighestRatedMoviesAPI().fetchMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(isITMostPopular ? 'Most Popular' : 'Highest Rated'),
          actions: [
            PopupMenuButton(
                onSelected: (v) {

                  if (v == favorites) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Favorite()));
                    } else
                        if (v == highestRated)
                    {
                      setState(() {
                        isITMostPopular = false;
                      });
                    } else if (v == mostPopular) {
                    setState(() {
                      isITMostPopular = true;
                    });
                  }
                },
                itemBuilder: (context) =>
                [
                  PopupMenuItem(value: favorites, child: Text(favorites)),
                  PopupMenuItem(
                      value: highestRated, child: Text(highestRated)),
                  PopupMenuItem(
                      value: mostPopular, child: Text(mostPopular)),
                ])
            // DropdownButton(
            //   icon: Icon(Icons.more_vert),
            //   items: const [
            //     DropdownMenuItem(child: Text('Favorites')),
            //     DropdownMenuItem(child: Text('Highest Rated')),
            //     DropdownMenuItem(child: Text('most Popular')),
            //   ],
            //   onChanged: (e) {},
            // )
          ],
        ),
        body: FutureBuilder(
            future: isITMostPopular ? movie : hrm,
            builder: (context, AsyncSnapshot s) {
              if (s.hasData) {
                return GridView.builder(
                    itemCount: s.data!.results!.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.57, crossAxisCount: 2),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetails(
                                    title: s.data!.results![i].title,
                                    overview: s.data!.results![i].overview,
                                    originalLanguage: s.data!.results![i]
                                        .originalLanguage,
                                    releaseDate: s.data!.results![i]
                                        .releaseDate,
                                    popularity: s.data!.results![i].popularity,
                                    poster: '''https://image.tmdb.org/t/p/w185${s
                                        .data!.results![i].posterPath}''',
                                    backdrop: '''https://image.tmdb.org/t/p/w185${s
                                        .data!.results![i].backdropPath}''',
                                    voteCount: s.data!.results![i].voteCount,
                                  ),
                            ),

                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(blurRadius: 1)]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  'https://image.tmdb.org/t/p/w185${s.data!
                                      .results![i].posterPath}',
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 15, left: 5),
                                  child: Text(
                                    '${s.data!.results![i].title}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    );
              } else if (s.hasError) {
                return Text('${s.error}');
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
//      height: MediaQuery.of(context).size.height * 0.7,
//                         width: MediaQuery.of(context).size.width * 0.2,

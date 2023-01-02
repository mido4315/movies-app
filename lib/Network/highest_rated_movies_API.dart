import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/highest_rated_movies_model.dart';

class HighestRatedMoviesAPI {
  Future<HighestRatedMovies> fetchMovie() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=fa5745da7dc2567ff75acde4074ca567');
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      return HighestRatedMovies.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('error');
    }
  }
}

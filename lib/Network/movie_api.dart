import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/movie_model.dart';

class MovieAPI {
  Future<Movie> fetchMovie() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=7f4b94007c44bda8e96b49456f05b955');
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      return Movie.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('error');
    }
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/features/src/data/models/movie_model.dart';
import 'package:movie_app/features/src/errors/failure.dart';

import '../../data/datasources/movie_datasource.dart';

class MovieDatasourceImpl implements MovieDatasource {
  Dio dio;
  // final API_KEY = '?apiKey=123123123124123';
  // final BASEPATH = 'https://api.themoviedb.org/4/';
  MovieDatasourceImpl(this.dio);

  @override
  Future<MovieModel> getMovieById(int id) {
    return getAndParseMovie('movie/$id');
  }

  Future<MovieModel> getAndParseMovie(String path) async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/11544?api_key=d3658a5e2b9b0484f233be9d70f0aeeb');

    response.data;

    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.data));
    } else {
      throw Failure();
    }
  }
}

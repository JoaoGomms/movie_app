import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/src/external/datasources/movie_datasource_impl.dart';

import 'features/app_widget.dart';
import 'features/src/data/datasources/movie_datasource.dart';
import 'features/src/data/repositories/movie_repository_impl.dart';
import 'features/src/domain/repositories/movie_repository.dart';
import 'features/src/domain/usecases/get_movie_by_id.dart';
import 'features/src/views/home/stores/home_store.dart';

void main() {
  configApp();

  runApp(const AppWidget());
}

void configApp() {
  GetIt getIt = GetIt.instance;

  getIt.registerSingleton<Dio>(configDio());
  getIt.registerSingleton<MovieDatasource>(MovieDatasourceImpl(GetIt.I()));
  getIt.registerSingleton<MovieRepository>(MovieRepositoryImpl(GetIt.I()));
  getIt.registerSingleton<GetMovieById>(GetMovieByIdUsecase(GetIt.I()));
  getIt.registerSingleton<HomeStore>(HomeStore(GetIt.I()));
}

Dio configDio() {
  Dio dio = Dio();

  // dio.options.baseUrl = 'https://api.themoviedb.org/4/';
  dio.options.queryParameters = {'apiKey': 'd3658a5e2b9b0484f233be9d70f0aeeb'};

  return dio;
}

import 'package:dartz/dartz.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../errors/failure.dart';
import '../datasources/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  late MovieDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Movie>> getMovieById(int id) async {
    try {
      final remoteData = await datasource.getMovieById(id);
      return Right(remoteData);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int id, int page) async {
    try {
      final remoteData = await datasource.getSimilarMovies(id, page);
      return Right(remoteData);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}

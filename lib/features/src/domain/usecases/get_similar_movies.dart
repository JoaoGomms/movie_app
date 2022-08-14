import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

abstract class GetSimilarMovies {
  Future<Either<Failure, List<Movie>>> call(int id, int page);
}

class GetSimilarMoviesUsecase implements GetSimilarMovies {
  MovieRepository repository;

  GetSimilarMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(int id, int page) {
    return repository.getSimilarMovies(id, page);
  }
}

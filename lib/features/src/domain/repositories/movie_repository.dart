import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';
import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, Movie>> getMovieById(int id);
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int id, int page);
}

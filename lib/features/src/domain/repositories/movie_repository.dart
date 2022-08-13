import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';
import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, Movie>> getMovieById(int id);
}

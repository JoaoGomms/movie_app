import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

abstract class GetMovieById {
  Future<Either<Failure, Movie>> call(int id);
}

class GetMovieByIdUsecase implements GetMovieById {
  MovieRepository repository;

  GetMovieByIdUsecase(this.repository);

  @override
  Future<Either<Failure, Movie>> call(int id) async {
    return await repository.getMovieById(id);
  }
}

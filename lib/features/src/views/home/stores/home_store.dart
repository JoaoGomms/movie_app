import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:movie_app/features/src/domain/usecases/get_movie_by_id.dart';

import '../../../domain/entities/movie.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  GetMovieById getMovieById;

  _HomeStoreBase(this.getMovieById);

  @observable
  Movie movie = Movie(name: '', imageUrl: '', popularity: 0, voteCount: 0);

  @action
  Future fetchMovieById(int id) async {
    try {
      final response = await getMovieById(id);
      response.fold(
        (l) => 'Erro ao retornar filme',
        (r) {
          movie = Movie(
              imageUrl: r.imageUrl,
              name: r.name,
              popularity: r.popularity,
              voteCount: r.voteCount);
        },
      );
    } catch (e) {
      log('ERRO NO FOLD BY ID: $e');
    }
  }
}

import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({required super.name, required super.imageUrl, required super.popularity, required super.voteCount});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    String imageBasepath = 'https://image.tmdb.org/t/p/w500';

    return MovieModel(
        imageUrl: imageBasepath + json["poster_path"],
        name: json['original_title'],
        popularity: json['popularity'],
        voteCount: json['vote_count']);
  }
}

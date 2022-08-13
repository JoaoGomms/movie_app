import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({required super.name, required super.imageUrl});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    String imageBasepath = 'https://image.tmdb.org/t/p/w500';

    return MovieModel(
        imageUrl: imageBasepath + json["poster_path"],
        name: json['original_title']);
  }

  Map<String, dynamic> toJson() {
    return {'original_title': name, 'poster_path': imageUrl};
  }
}

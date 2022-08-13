import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({required super.name, required super.imageUrl});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    // TODO Replace json with real data
    return MovieModel(
        imageUrl: json['atributoJsonImagem'], name: json['atributoJsonTitle']);
  }

  Map<String, dynamic> toJson() {
    return {'atributoJsonTitle': name, 'atributoJsonImagem': imageUrl};
  }
}

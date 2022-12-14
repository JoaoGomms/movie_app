import 'package:flutter/material.dart';
import 'package:movie_app/features/src/domain/entities/movie.dart';

class SimilarMovieInfo extends StatefulWidget {
  final Movie movie;
  const SimilarMovieInfo({Key? key, required this.movie}) : super(key: key);

  @override
  State<SimilarMovieInfo> createState() => _SimilarMovieInfoState();
}

class _SimilarMovieInfoState extends State<SimilarMovieInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.network(
        widget.movie.imageUrl,
        height: 90,
      ),
      const SizedBox(
        width: 4,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(widget.movie.name,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
              softWrap: true,
              overflow: TextOverflow.ellipsis),
          // Text(data)
          // Text('Ano e Genero')
        ],
      ),
    ]);
  }
}

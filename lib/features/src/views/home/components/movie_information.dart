import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/src/views/home/components/movie_info_icon_tile.dart';

import '../stores/home_store.dart';

class MovieInformation extends StatefulWidget {
  const MovieInformation({Key? key}) : super(key: key);

  @override
  State<MovieInformation> createState() => _MovieInformationState();
}

class _MovieInformationState extends State<MovieInformation> {
  final HomeStore store = GetIt.I.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          Image.network(
            store.movie.imageUrl,
            fit: BoxFit.fitWidth,
            height: 250,
            width: MediaQuery.of(context).size.width,
          ),
          // TODO GRADIENT
          // const SizedBox(
          //   height: 25,
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      store.movie.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_rounded))
                  ],
                ),
                Row(
                  children: [
                    MovieInfoIconTile(
                        icon: Icons.favorite,
                        text: '${store.movie.voteCount} Likes'),
                    const SizedBox(
                      width: 24,
                    ),
                    MovieInfoIconTile(
                        icon: Icons.abc_rounded,
                        text: '${store.movie.voteCount} Watched')
                  ],
                )
              ],
            ),
          )
        ],
      );
    });
  }
}

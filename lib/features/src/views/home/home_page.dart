import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/src/views/home/components/movie_information.dart';
import 'package:movie_app/features/src/views/home/components/similar_movie_info.dart';
import 'package:movie_app/features/src/views/home/stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = GetIt.I.get<HomeStore>();

  @override
  void initState() {
    asyncFetch();
    super.initState();
  }

  Future<void> asyncFetch() async {
    await store.fetchMovieById(555);
    await store.fetchSimilarMovies(555, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      )),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const MovieInformation(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: store.similarMovies.length,
                  itemBuilder: (context, index) {
                    var actualSimilarMovie = store.similarMovies[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SimilarMovieInfo(movie: actualSimilarMovie),
                        const Icon(Icons.check_circle)
                      ],
                    );
                  })
            ],
          ),
        );
      }),
    );
  }
}

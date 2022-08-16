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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const MovieInformation(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.7),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.blue[900],
                      ),
                    ),
                  )
                ],
              ),
              Observer(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        var actualSimilarMovie = store.similarMovies[index];
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: SimilarMovieInfo(movie: actualSimilarMovie));
                      }),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

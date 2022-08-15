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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                          Colors.transparent,
                          Colors.blue.shade300,
                        ]))),
                  )
                ],
              ),
              Observer(builder: (context) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: store.similarMovies.length,
                    itemBuilder: (context, index) {
                      var actualSimilarMovie = store.similarMovies[index];
                      return SimilarMovieInfo(movie: actualSimilarMovie);
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}

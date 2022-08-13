import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/src/views/home/components/movie_info_icon_tile.dart';
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
        return Column(
          children: [
            Image.network(store.movie.imageUrl),
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
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

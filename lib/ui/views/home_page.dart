import 'package:flutter/material.dart';
import 'package:movies_app/ui/views/detail_page.dart';

import '../../data/entity/movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Movies>> moviesDownload() async {
    var moviesList = <Movies>[];
    var m1 = Movies(id: 0, ad: "Django", resim: "django.png", fiyat: 24);
    var m2 =
        Movies(id: 1, ad: "Interstellar", resim: "interstellar.png", fiyat: 32);
    var m3 = Movies(id: 2, ad: "Inception", resim: "inception.png", fiyat: 16);
    var m4 = Movies(
        id: 3,
        ad: "The Hateful Eight",
        resim: "thehatefuleight.png",
        fiyat: 28);
    var m5 =
        Movies(id: 4, ad: "The Pianist", resim: "thepianist.png", fiyat: 18);
    var m6 = Movies(id: 5, ad: "Anadoluda", resim: "anadoluda.png", fiyat: 10);
    moviesList.add(m1);
    moviesList.add(m2);
    moviesList.add(m3);
    moviesList.add(m4);
    moviesList.add(m5);
    moviesList.add(m6);
    return moviesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmler"),
      ),
      body: FutureBuilder<List<Movies>>(
        future: moviesDownload(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            var moviesList = snapShot.data;
            return GridView.builder(
              itemCount: moviesList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.8),
              itemBuilder: (context, indeks) {
                var movie = moviesList[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(movie: movie)));
                  },
                  child: Card(
                    child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("images/${movie.resim}"),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${movie.fiyat} ₺",
                              style: const TextStyle(fontSize: 24),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                print("${movie.ad} sepete eklendi");
                              },
                              child: const Text("Sepete Ekle"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}

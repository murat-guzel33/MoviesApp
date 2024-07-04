import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/cubit/home_page_cubit.dart';
import 'package:movies_app/ui/views/detail_page.dart';

import '../../data/entity/movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomePageCubit>().moviesDownload();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmler"),
      ),
      body: BlocBuilder<HomePageCubit,List<Movies>>(
        builder: (context, movieList) {
          if (movieList.isNotEmpty) {
            return GridView.builder(
              itemCount: movieList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.8),
              itemBuilder: (context, indeks) {
                var movie = movieList[indeks];
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

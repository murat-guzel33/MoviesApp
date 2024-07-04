import '../data/entity/movies.dart';

class HomePageRepository{

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
}
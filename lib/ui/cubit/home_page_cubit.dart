import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/entity/movies.dart';
import 'package:movies_app/repo/home_page_repository.dart';

class HomePageCubit extends Cubit<List<Movies>> {
  HomePageCubit() : super(<Movies>[]);

  var mrepo = HomePageRepository();

  Future<void> moviesDownload() async {
    var list = await mrepo.moviesDownload();
    emit(list);
  }
}

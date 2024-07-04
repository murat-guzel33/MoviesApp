import 'package:flutter/material.dart';
import 'package:movies_app/data/entity/movies.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  Movies movie;

  DetailPage({super.key, required this.movie});

  @override
  State<DetailPage> createState() => _State();
}

class _State extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.ad),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.movie.resim}"),
            Text(
              "${widget.movie.fiyat} ₺",
              style: const TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}

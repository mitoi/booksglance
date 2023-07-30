import 'package:book_glance/widgets/book_presentation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BooksListScreen extends StatefulWidget {
  const BooksListScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  // ignore: library_private_types_in_public_api
  _BooksListScreenState createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 190,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160,
            child: Image.network(
                "https://m.media-amazon.com/images/I/71aG+xDKSYL.jpg"),
          ),
          Container(
              width: 160,
              child: Image.network(
                  "https://m.media-amazon.com/images/I/81bGKUa1e0L.jpg")),
          Container(
              width: 160,
              child: Image.network(
                  "https://m.media-amazon.com/images/I/61Hu-4ZY7yL.jpg")),
          Container(
            width: 160,
            child: Image.network(
                "https://m.media-amazon.com/images/I/41P3AE+9GeL.jpg"),
          ),
          Container(
            width: 160,
            child: Image.network(
                "https://m.media-amazon.com/images/I/61MJsC3XqbL.jpg"),
          ),
        ],
      ),
    );
  }
}

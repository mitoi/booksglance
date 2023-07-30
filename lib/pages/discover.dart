import 'package:book_glance/pages/books_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  // ignore: library_private_types_in_public_api
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late User _user;

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const categoryHeaderStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black54);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discover',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recently added",
                  style: categoryHeaderStyle,
                ),
                BooksListScreen(user: _user)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Today for you",
                  style: categoryHeaderStyle,
                ),
                BooksListScreen(user: _user)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Categories",
                  style: categoryHeaderStyle,
                ),
                const Text("add some categories in here"),
                BooksListScreen(user: _user)
              ],
            ),
          ]),
        ),
      ]),
    );
  }
}

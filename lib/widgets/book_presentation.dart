import 'package:flutter/material.dart';

class BookPresentationWidget extends StatelessWidget {
  const BookPresentationWidget(this.bookData, {super.key});
  // ignore: prefer_typing_uninitialized_variables
  final bookData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: Image.network(bookData.coverPic),
    );
  }
}

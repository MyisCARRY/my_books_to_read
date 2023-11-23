import 'package:flutter/material.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/books/presentation/widgets/single_book_widget.dart';

class BooksList extends StatelessWidget {
  const BooksList({
    required this.books,
    Key? key,
  }) : super(key: key);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: books.length,
      itemBuilder: (_, int i) => SingleBookWidget(book: books[i]),
    );
  }
}

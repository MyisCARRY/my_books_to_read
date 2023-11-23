import 'package:dio/dio.dart';
import 'package:my_books_to_read/features/books/data/datasources/books_datasource.dart';
import 'package:my_books_to_read/features/books/domain/models/book.dart';
import 'package:my_books_to_read/features/books/domain/models/open_library_book.dart';
import 'package:my_books_to_read/features/books/domain/models/search_books_param.dart';

class OpenLibraryDatasource extends BooksDatasource {
  OpenLibraryDatasource({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<Book>> searchBooks(SearchBooksParam param) async {
    final response = await dio.get('search.json?${param.bookSearchType.searchParameter}=${param.phrase}&limit=20');
    final List results = response.data['docs'] as List;
    final List<OpenLibraryBook> openLibraryBooks = results.map((e) => OpenLibraryBook.fromJson(e)).toList();
    final List<Book> books = openLibraryBooks
        .map((e) => Book(
              id: e.key,
              title: e.title,
              authors: e.authors,
              favorite: false,
              coverImage: 'https://covers.openlibrary.org/b/id/${e.coverId ?? ''}-M.jpg?default=false',
            ))
        .toList();

    return books;
  }
}

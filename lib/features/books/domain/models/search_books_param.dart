import 'package:my_books_to_read/features/books/domain/enums/search_books_type_enum.dart';

class SearchBooksParam {
  SearchBooksParam({
    required this.phrase,
    required this.bookSearchType,
  });

  final String phrase;
  final SearchBooksTypeEnum bookSearchType;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_books_to_read/generated/l10n.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String id,
    required String title,
    required List<String>? authors,
    required bool favorite,
    required String coverImage,
  }) = _Book;

  const Book._();

  String getAuthorsString() {
    final tempAuthors = this.authors;
    if (tempAuthors == null || tempAuthors.isEmpty) {
      return S.current.authorUnknown;
    } else if (tempAuthors.length == 1) {
      return tempAuthors.first;
    } else {
      final String result = tempAuthors.fold<String>('', (previous, element) => '$previous$element, ');
      return result.substring(0, result.length - 2);
    }
  }

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

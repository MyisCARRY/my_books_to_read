import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_library_book.freezed.dart';
part 'open_library_book.g.dart';

@freezed
class OpenLibraryBook with _$OpenLibraryBook {
  const factory OpenLibraryBook({
    required String key,
    required String title,
    @JsonKey(name: 'author_name') required List<String>? authors,
    @JsonKey(name: 'cover_i') required int? coverId,
  }) = _OpenLibraryBook;

  factory OpenLibraryBook.fromJson(Map<String, dynamic> json) => _$OpenLibraryBookFromJson(json);
}

import 'package:flutter/material.dart';
import 'package:my_books_to_read/features/books/domain/enums/search_books_type_enum.dart';

class SearchBooksTypeWidget extends StatelessWidget {
  const SearchBooksTypeWidget({
    required this.currentSearchType,
    required this.onChange,
    Key? key,
  }) : super(key: key);

  final SearchBooksTypeEnum currentSearchType;
  final Function(SearchBooksTypeEnum) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: SearchBooksTypeEnum.values
          .map((e) => Flexible(
                child: RadioListTile<SearchBooksTypeEnum>(
                  contentPadding: EdgeInsets.zero,
                  title: Text(e.searchParameter),
                  value: e,
                  groupValue: currentSearchType,
                  onChanged: (_) => onChange(e),
                ),
              ))
          .toList(),
    );
  }
}

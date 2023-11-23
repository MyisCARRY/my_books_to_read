import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/features/books/domain/enums/search_books_type_enum.dart';

class SearchBooksTypeCubit extends Cubit<SearchBooksTypeEnum> {
  SearchBooksTypeCubit() : super(SearchBooksTypeEnum.all);

  void change(SearchBooksTypeEnum searchType) => emit(searchType);
}

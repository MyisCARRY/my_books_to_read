enum SearchBooksTypeEnum {
  all('q'),
  title('title'),
  author('author');

  const SearchBooksTypeEnum(this.searchParameter);

  final String searchParameter;
}

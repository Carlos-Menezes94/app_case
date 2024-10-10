class DataSourceResponse<T> {
  final T data;
  final bool hasSuccess;

  DataSourceResponse({
    required this.data,
    required this.hasSuccess,
  });
}

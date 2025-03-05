class RestClientError {
  final int statusCode;
  final String message;
  final Map<String, dynamic>? data;

  RestClientError({
    required this.statusCode,
    required this.message,
    required this.data,
  });
}

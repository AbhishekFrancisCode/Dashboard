class ApiResponse<T> {
  T data;
  final bool isSuccess;
  final String? message;

  ApiResponse({
    required this.data,
    this.isSuccess = true,
    this.message,
  });
}

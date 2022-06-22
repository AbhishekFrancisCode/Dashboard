class ApiResponse<T> {
  T data;
  final bool isSuccess;
  final String message;

  ApiResponse(
      {this.isSuccess = true, required this.message, required this.data});
}

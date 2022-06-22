import 'package:http/http.dart' as http;
import 'package:student_dashboard/model/student.dart';
import 'package:student_dashboard/services/client/client_api.dart';

import 'api_response.dart';

class RemoteRepository {
  late ApiClient _apiClient;
  static final RemoteRepository _singleton = RemoteRepository._internal();
  factory RemoteRepository() => _singleton;

  RemoteRepository._internal() {
    _apiClient = ApiClient(httpClient: http.Client());
  }

  Future<ApiResponse<Student>> getStudentData() => _apiClient.getStudentData();
}

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:student_dashboard/config.dart';
import 'package:student_dashboard/model/student.dart';
import 'package:student_dashboard/services/client/api_response.dart';
import 'package:student_dashboard/services/client/failure.dart';
import 'package:student_dashboard/utils/app.dart';

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class ApiClient {
  final http.Client httpClient;
  ApiClient({required this.httpClient});

  Future<ApiResponse<Student>> getStudentData() async {
    final url = config.baseUrl;
    final response = await _getResponse(url!);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final list = Student.fromJson(json);
      return ApiResponse(data: list);
    } else {
      final code = response.statusCode;
      throw Failure("Something went wrong ($code). Please retry!");
    }
  }

  Future<http.Response> _getResponse(String url, [dynamic headers]) async {
    return await _withRetry(
        () => httpClient.get(Uri.parse(url), headers: headers));
  }

  Future<http.Response> _withRetry(Future<http.Response> Function() fn) async {
    const maxRetryAttempts = 3;
    const retryDelay = 400; //millisecs
    int attempts = 0;
    while (true) {
      attempts++;
      bool canRetry = attempts <= maxRetryAttempts;
      try {
        final response = await fn();
        if (response.statusCode >= 400 && canRetry) {
          await App().init(refreshToken: true);
        } else {
          return response;
        }
      } on Exception catch (e) {
        if (canRetry) {
          final duration = Duration(milliseconds: (attempts) * retryDelay);
          await Future.delayed(duration);
        } else {
          if (e is SocketException) {
            throw Failure("Unable to connect to internet");
          } else {
            throw Failure("Something went wrong. Please retry!");
          }
        }
      }
    }
  }
}

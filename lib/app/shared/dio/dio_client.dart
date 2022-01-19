import 'package:dio/dio.dart';

import 'package:dio/dio.dart';

class DioClient {
  Dio dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {"Authorization":"Token 8b34c604f8c467c5950550f6870bde20dc5229fb"}
    ));
}

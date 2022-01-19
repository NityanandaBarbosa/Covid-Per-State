import 'package:brazil_covid_per_state/app/shared/consts/AppConsts.dart';
import 'package:dio/dio.dart';

import 'package:dio/dio.dart';

class DioClient {
  Dio dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {"Authorization": AppConsts.apiToken}
    ));
}

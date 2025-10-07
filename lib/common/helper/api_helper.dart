import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/helper/dio_helper_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:requests_inspector/requests_inspector.dart';

class ApiHelper {
  final Dio dio;

  ApiHelper({
    required String baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) : dio = Dio(BaseOptions(
          connectTimeout: connectTimeout ?? const Duration(seconds: 60),
          receiveTimeout: receiveTimeout ?? const Duration(seconds: 60),
          baseUrl: baseUrl,
        ))
          ..interceptors.addAll([
            RequestsInspectorInterceptor(),
            DioLoggingInterceptor(),
          ]);
}

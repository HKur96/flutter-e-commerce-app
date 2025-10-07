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
          headers: {
            "X-API-KEY": kDebugMode
                ? const String.fromEnvironment('X-API-KEY_DEV')
                : const String.fromEnvironment('X_API_KEY_PROD'),
          },
        ))
          ..interceptors.addAll([
            RequestsInspectorInterceptor(),
            DioLoggingInterceptor(),
          ]);
}

import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/config/extensions.dart';
import 'package:ecommerce_app/common/config/global.dart';
import 'package:flutter/material.dart';

class DioLoggingInterceptor extends InterceptorsWrapper {
  SnackBar? _snackBar;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        _onConnectionTimeout(err, handler);
        break;
      default:
        _onRefreshToken(err, handler);
    }
  }

  /// [_onRefreshToken] digunakan untuk menghandle ketika token expired.
  void _onRefreshToken(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // String? oldAccessRefreshToken = KreasiSharedPref().getRefreshToken();
    // UserModel? currentUser = await KreasiSharedPref().getUser();

    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      // _navigateToLoginScreen(
      //   (err.response?.data['message'] is String)
      //       ? err.response?.data['message']
      //       : gPesanError,
      // );
    }

    // if (isAccessTokenExpired &&
    //     oldAccessRefreshToken != null &&
    //     currentUser?.isLogin == true) {
    //   Map<String, dynamic> resAccessToken = await _getRefreshToken(
    //     oldAccessRefreshToken,
    //     currentUser,
    //   );

    //   if (resAccessToken.isEmpty) {
    //     _navigateToLoginScreen();
    //     return handler.next(err);
    //   }

    //   String? newAccessToken = resAccessToken['tokenJWT'];
    //   String? newRefreshAccessToken = resAccessToken['refreshToken'];

    //   if ((newAccessToken == null || newAccessToken.isEmpty) ||
    //       (newRefreshAccessToken == null || newRefreshAccessToken.isEmpty)) {
    //     _navigateToLoginScreen();
    //     return handler.next(err);
    //   }

    //   err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

    //   gTokenJwt = newAccessToken;
    //   DioOptionHelper().setDioOption = gTokenJwt;

    //   await KreasiSharedPref().setTokenJWT(newAccessToken);
    //   await KreasiSharedPref().setRefreshToken(newRefreshAccessToken);

    //   await _tryReconnect(handler, err);
    // } else if (isAccessTokenExpired) {
    //   _navigateToLoginScreen();
    // }
    return handler.next(err);
  }

  // Future<void> _tryReconnect(
  //   ErrorInterceptorHandler handler,
  //   DioException err,
  // ) async {
  //   try {
  //     return handler.resolve(await _retryRequest(err.requestOptions));
  //   } catch (e) {
  //     _navigateToLoginScreen();
  //     return handler.next(err);
  //   }
  // }

  /// [_onConnectionTimeout] digunakan untuk menghandle ketika connection timeout
  void _onConnectionTimeout(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    _snackBar ??= SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Text(
        'Koneksi internet kamu lemah,\n'
        'Coba pindah ke tempat yang koneksi lebih stabil ya.',
        style: gNavigatorKey.currentContext!.text.labelSmall?.copyWith(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(gNavigatorKey.currentContext!)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        _snackBar!,
      );

    return handler.next(err);
  }

  /// [_navigateToLoginScreen] digunakan untuk me-redirect ke login screen.
  /// <br> Ketika gagal hit endpoint refresh token

  /// [_retryRequest] digunakan untuk mencoba request ulang
  // Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: requestOptions.headers,
  //   );
  //   return _dio.request<dynamic>(
  //     requestOptions.path,
  //     data: requestOptions.data,
  //     queryParameters: requestOptions.queryParameters,
  //     options: options,
  //   );
  // }

  /// [_getRefreshToken] digunakan untuk me-refresh token
  // Future<Map<String, dynamic>> _getRefreshToken(
  //   String oldAccessRefreshToken,
  //   UserModel? currentUser,
  // ) async {
  //   try {
  //     final response = await _dio.post(
  //       '/auth/api/v1/goexpert/siswa/refresh',
  //       data: {
  //         "refreshToken": oldAccessRefreshToken,
  //         "id_sekolah_kelas": int.tryParse(currentUser?.idSekolahKelas ?? '0'),
  //         "id_kelas": currentUser?.idKelas,
  //         "id_jenis_kelas": currentUser?.idJenisKelas,
  //         "id_gedung": int.tryParse(currentUser?.idGedung ?? '0'),
  //         "id_komar": currentUser?.idKomar,
  //         "id_sekolah": int.tryParse(currentUser?.idSekolah ?? '0'),
  //       },
  //       options: DioOptionHelper().dioOption,
  //     );

  //     return response.data['data'];
  //   } catch (e) {
  //     return {};
  //   }
  // }
}

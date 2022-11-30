part of foodapp_utils;

class NetworkUtil {
  factory NetworkUtil() => _networkUtil;

  NetworkUtil._internal();

  static final NetworkUtil _networkUtil = NetworkUtil._internal();

  final logger = Logger();

  Dio _getHttpClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: FoodAppConfig.instance!.values.baseDomain,
        contentType: 'application/json',
        headers: <String, dynamic>{'Accept': 'application/json'},
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ${HiveServiceImplementation().retrieveToken()}';
          return handler.next(options);
        },
      ),
    );

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }

  Future<Map<String, dynamic>> getReq(String url) async {
    final response = await _getHttpClient().get<dynamic>(url);

    final responseBody = response.data as Map<String, dynamic>;
    if (responseBody.isEmpty) return <String, dynamic>{};
    return responseBody;
  }

  Future<Map<String, dynamic>> deleteReq(String url) async {
    final response = await _getHttpClient().delete<dynamic>(url);

    final responseBody = response.data as Map<String, dynamic>;
    if (responseBody.isEmpty) return <String, dynamic>{};
    return responseBody;
  }

  Future<Map<String, dynamic>> postReq(
    String url, {
    required String body,
  }) async {
    try {
      final response = await _getHttpClient().post<dynamic>(url, data: body);

      final responseBody = response.data as Map<String, dynamic>;
      if (responseBody.isEmpty) return <String, dynamic>{};
      return responseBody;
    } on DioError catch (err) {
      if (DioErrorType.response == err.type) {
        logger
          ..d('Error: ${err.toString()}')
          ..i('${err.response?.statusCode}')
          ..i('Error: ${err.response?.data}');

        if (err.response?.statusCode == 422) {
          final errors = FoodAppValidationError.fromJson(
            err.response?.data as Map<String, dynamic>,
          );
          throw Failure(errors: errors.errors, message: 'Validation failed');
        }
        if (err.response?.statusCode == 401) {
          throw Failure(message: 'Unauthenticated');
        }
      } else if (DioErrorType.connectTimeout == err.type) {
        throw const SocketException('No internet connection');
      }
      Logger().e(err);
      throw Failure(message: 'Server error');
    }
  }

  Future<Map<String, dynamic>> putReq(
    String url, {
    String? body,
  }) async {
    try {
      final response = await _getHttpClient().put<dynamic>(url, data: body);

      final responseBody = response.data as Map<String, dynamic>;
      if (responseBody.isEmpty) return <String, dynamic>{};
      return responseBody;
    } on DioError catch (err) {
      if (DioErrorType.response == err.type) {
        logger
          ..d('Error: ${err.toString()}')
          ..i('${err.response?.statusCode}')
          ..i('Error: ${err.response?.data}');

        if (err.response?.statusCode == 422) {
          final errors = FoodAppValidationError.fromJson(
            err.response?.data as Map<String, dynamic>,
          );
          throw Failure(errors: errors.errors, message: 'Validation failed');
        }
        if (err.response?.statusCode == 401) {
          throw Failure(message: 'Unauthenticated');
        }
      } else if (DioErrorType.connectTimeout == err.type) {
        throw const SocketException('No internet connection');
      }
      throw Failure(message: 'Server error');
    }
  }

  Future<Map<String, dynamic>> multipartReq(
    String url, {
    String? filePath,
    String? fileKey,
    required Map<String, dynamic> body,
  }) async {
    try {
      final formData = FormData.fromMap(body);

      if (filePath != null) {
        final fileName = filePath.split('/').last;

        final file = await MultipartFile.fromFile(
          filePath,
          filename: fileName,
        );

        if (fileKey == null) {
          formData.files.add(
            MapEntry(
              'mediafile',
              file,
            ),
          );
        } else {
          formData.files.add(
            MapEntry(
              fileKey,
              file,
            ),
          );
        }
      }

      final response = await _getHttpClient().post<dynamic>(
        url,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
          headers: <String, dynamic>{
            'Accept': '*/*',
          },
        ),
        onSendProgress: (int send, int total) {
          Logger().i((send / total) * 100);
        },
      );

      final responseBody = response.data as Map<String, dynamic>;
      if (responseBody.isEmpty) return <String, dynamic>{};
      return responseBody;
    } on DioError catch (err) {
      if (DioErrorType.response == err.type) {
        logger
          ..d('Error: ${err.toString()}')
          ..i('${err.response?.statusCode}')
          ..i('Error: ${err.response?.data}');

        if (err.response?.statusCode == 422) {
          final errors = FoodAppValidationError.fromJson(
            err.response?.data as Map<String, dynamic>,
          );
          throw Failure(errors: errors.errors, message: 'Validation failed');
        }

        if (err.response?.statusCode == 403) {
          throw Failure(
            message: err.response!.statusMessage!,
          );
        }

        if (err.response?.statusCode == 401) {
          throw Failure(message: 'Unauthenticated');
        }
      } else if (DioErrorType.connectTimeout == err.type) {
        throw Failure(message: 'No internet connection');
      }
      throw Failure(message: 'Server error');
    }
  }
}

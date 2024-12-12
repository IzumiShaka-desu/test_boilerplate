import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import '../exception.dart';
import 'interceptors.dart';

// abstract class BaseClient with DioMixin implements Dio {
//   @override
//   HttpClientAdapter get httpClientAdapter => IOHttpClientAdapter();

//   @override
//   BaseOptions get options => BaseOptions(
//         baseUrl: AppConfig.baseUrl,
//         contentType: 'application/json',
//         responseType: ResponseType.json,
//         headers: {
//           'Accept': 'application/json',
//         },
//       );

//   @override
//   Interceptors get interceptors => Interceptors()
//     ..add(LogInterceptor(requestBody: true, responseBody: true))
//     ..add(ErrorInterceptor());

//   /// A utility function for making asynchronous requests with error handling spesifically for api networking.
//   ///
//   /// The [tryRequest] function takes a `computation` function as a parameter, which
//   /// represents the asynchronous computation to be executed. It wraps the computation
//   /// in a try-catch block and handles specific error types by throwing corresponding
//   /// custom exceptions. If the computation encounters an unknown error, a generic
//   /// [ServerException] is thrown.
//   ///
//   /// The following specific error types are handled:
//   ///   - [BadRequestError]: Thrown when the request is malformed.
//   ///   - [UnAuthorizedError]: Thrown when the request lacks proper authentication.
//   ///   - [ForbiddenError]: Thrown when the server refuses to fulfill the request.
//   ///   - [NotFoundError]: Thrown when the requested resource is not found.
//   ///   - [InternalServerError]: Thrown when the server encounters an unexpected condition.
//   ///   - [ServiceUnavailable]: Thrown when the server is unavailable to handle the request.
//   ///   - [TimeOutError] or [GatewayTimeout]: Thrown when the request times out.
//   ///
//   /// Any unhandled exception results in a generic [ServerException].
//   ///
//   /// Returns a `Future` containing the result of the computation.
//   Future<T> tryRequest<T>(FutureOr<T> Function() computation) async {
//     try {
//       return await computation();
//     } catch (e, s) {
//       debugPrint(e.toString());
//       debugPrint(s.toString());
//       if (e is BadRequestError) {
//         throw BadRequestException(e.message);
//       }
//       if (e is UnAuthorizedError) {
//         throw UnAuthorizedException(e.message);
//       }
//       if (e is ForbiddenError) {
//         throw ForbiddenException();
//       }
//       if (e is NotFoundError) {
//         throw NotFoundException(message: e.message);
//       }
//       if (e is InternalServerError) {
//         throw ServerException(
//           message: e.message,
//         );
//       }
//       if (e is ServiceUnavailable) {
//         throw ServiceUnavailableException(message: e.message);
//       }
//       if (e is TimeOutError || e is GatewayTimeout) {
//         throw TimeoutException();
//       }

//       throw ServerException();
//     }
//   }
// }

class KhonicClient with DioMixin implements Dio {
  final String baseUrl;
  KhonicClient({
    required this.baseUrl,
    List<Interceptor> interceptors = const [],
  }) : super() {
    this.interceptors.addAll(
      [...interceptors],
    );
  }
  @override
  HttpClientAdapter get httpClientAdapter => IOHttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
        responseType: ResponseType.json,
        headers: {
          'Accept': 'application/json',
        },
      );
  @override
  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return tryRequest(() => super.post<T>(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ));
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return tryRequest(() => super.get<T>(
          path,
          queryParameters: queryParameters,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        ));
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return tryRequest(() => super.put<T>(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ));
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return tryRequest(() => super.delete<T>(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        ));
  }

  /// A utility function for making asynchronous requests with error handling spesifically for api networking.
  ///
  /// The [tryRequest] function takes a `computation` function as a parameter, which
  /// represents the asynchronous computation to be executed. It wraps the computation
  /// in a try-catch block and handles specific error types by throwing corresponding
  /// custom exceptions. If the computation encounters an unknown error, a generic
  /// [ServerException] is thrown.
  ///
  /// The following specific error types are handled:
  ///   - [BadRequestError]: Thrown when the request is malformed.
  ///   - [UnAuthorizedError]: Thrown when the request lacks proper authentication.
  ///   - [ForbiddenError]: Thrown when the server refuses to fulfill the request.
  ///   - [NotFoundError]: Thrown when the requested resource is not found.
  ///   - [InternalServerError]: Thrown when the server encounters an unexpected condition.
  ///   - [ServiceUnavailable]: Thrown when the server is unavailable to handle the request.
  ///   - [TimeOutError] or [GatewayTimeout]: Thrown when the request times out.
  ///
  /// Any unhandled exception results in a generic [ServerException].
  ///
  /// Returns a `Future` containing the result of the computation.
  Future<T> tryRequest<T>(FutureOr<T> Function() computation) async {
    try {
      return await computation();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      if (e is BadRequestError) {
        throw BadRequestException(e.message);
      }
      if (e is UnAuthorizedError) {
        throw UnAuthorizedException(e.message);
      }
      if (e is ForbiddenError) {
        throw ForbiddenException();
      }
      if (e is NotFoundError) {
        throw NotFoundException(message: e.message);
      }
      if (e is InternalServerError) {
        throw ServerException(
          message: e.message,
        );
      }
      if (e is ServiceUnavailable) {
        throw ServiceUnavailableException(message: e.message);
      }
      if (e is TimeOutError || e is GatewayTimeout) {
        throw TimeoutException();
      }

      throw ServerException();
    }
  }
}

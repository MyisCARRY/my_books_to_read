import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';

import 'package:fimber/fimber.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:my_books_to_read/core/app/type_aliases.dart';
import 'package:my_books_to_read/core/error/failures.dart';
import 'package:my_books_to_read/core/error/form_decoder.dart';

class RepositoryRequestHandler<T> {
  FutureFailable<T> call({
    required Failure defaultFailure,
    required Future<T> Function() request,
  }) async {
    try {
      return Right(await request());
    } catch (error) {
      Fimber.e(error.toString());
      
      String errorMessage = '\n$error, $defaultFailure\n';
      final currentStackTrace = StackTrace.current;

      if (error is DioError) {
        final requestData = 'Request data: ${error.requestOptions.data}';
        final responseData = 'Response data: ${error.response?.data}';

        // TODO(Init): change name to any auth related EP so the user password wont be uploaded to logger
        if (error.requestOptions.path.contains('Authentication')) {
          final requestPath = 'Request path: ${error.requestOptions.baseUrl}';
          errorMessage += '$requestPath\n$responseData';
        } else {
          final requestPath = 'Request path: ${error.requestOptions.baseUrl}${error.requestOptions.path}';
          errorMessage += '$requestPath\n$requestData\n$responseData';
        }
      }

      await FirebaseCrashlytics.instance.recordError(errorMessage, currentStackTrace);
      
      final failure = handleError(error, defaultFailure);
      return Left(failure);
    }
  }
}

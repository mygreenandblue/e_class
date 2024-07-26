import 'package:dio/dio.dart';
import 'package:eclass/core/api/api_exception.dart';
import 'package:eclass/core/extensions/dio_extention.dart';

import 'package:flutter/foundation.dart';

Future<T?> getSingleResult<T>(
  String url,
  T Function(Map<String, dynamic>) fromJson,
  ErrorCode errorCode, {
  required Dio client,
}) async {
  try {
    final response = await client.get(
      url,
      options: Options(
        validateStatus: (status) => status == 200,
      ),
    );
    return compute(
      fromJson,
      response.data as Map<String, dynamic>,
    );
  } on DioException catch (exception) {
    throw exception.unravel(orElse: ApiException(errorCode));
  }
}

Future<List<T>> getCollection<T>(
  String url,
  T Function(Map<String, dynamic>) fromJson,
  ErrorCode errorCode, {
  required Dio client,
}) async {
  try {
    final response = await client.get(
      url,
      options: Options(
        validateStatus: (status) => status == 200,
      ),
    );
    final Map<String, dynamic> body = response.data;
    if (body['count'] == 0) {
      return <T>[];
    } else {
      return compute(
        _collectionFromJson,
        _CollectionFromJsonSerializationParams(
          fromJson,
          (body['results'] as List).cast<Map<String, dynamic>>(),
        ),
      );
    }
  } on DioException catch (exception) {
    throw exception.unravel(orElse: ApiException(errorCode));
  }
}

List<T> _collectionFromJson<T>(
  _CollectionFromJsonSerializationParams<T> params,
) {
  return params.list.map<T>((result) => params.fromJson(result)).toList();
}

class _CollectionFromJsonSerializationParams<T> {
  final T Function(Map<String, dynamic>) fromJson;
  final List<Map<String, dynamic>> list;

  _CollectionFromJsonSerializationParams(this.fromJson, this.list);
}

int? tryParseNullable(String? source, {int? radix}) {
  if (source == null) return null;
  return int.tryParse(source, radix: radix);
}

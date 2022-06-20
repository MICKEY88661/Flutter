import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO use interface to decouple dio package
// TODO remove hard code api key
final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: "https://api.covalenthq.com/v1/",
      queryParameters: {"key": "ckey_ad25a9eb593c4bdabc741ca4e18"},
    ),
  )..interceptors.add(
      LogInterceptor(
        requestHeader: false,
        // responseHeader: false,
      ),
    );
});

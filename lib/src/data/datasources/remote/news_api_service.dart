import 'dart:io';
import 'package:dio/dio.dart';
import '../../../core/utils/constants.dart';
import '../../models/breaking_news_response_model.dart';

class _NewsApiService implements NewsApiService {
  final Dio _dio;
  String baseUrl;

  _NewsApiService(this._dio, {this.baseUrl = "https://newsapi.org/v2"}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  @override
  Future<Response<BreakingNewsResponseModel>> getBreakingNewsArticles(
      {apiKey = kApiKey, country = '', category = '', page = 1, pageSize = 100}) async {
    final queryParameters = <String, dynamic>{
      r'apiKey': apiKey,
      r'country': country,
      r'category': category,
      r'page': page,
      r'pageSize': pageSize
    };
    final _result = await _dio.get('$baseUrl/top-headlines', queryParameters: queryParameters);
    final value = BreakingNewsResponseModel.fromJson(_result.data ?? <String, dynamic>{});
    final response = Response(
      data: value,
      requestOptions: RequestOptions(path: '$baseUrl/top-headlines'),
      statusCode: HttpStatus.ok
    );
    return response;
  }
}

abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  Future<Response<BreakingNewsResponseModel>> getBreakingNewsArticles({
    String apiKey,
    String country,
    String category,
    int page,
    int pageSize,
  });
}
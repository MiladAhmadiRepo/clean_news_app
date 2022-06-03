import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/params/article_request.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/article.dart';
import '../../../domain/usecaes/get_articles_usecase.dart';

part 'remote_articles_state.dart';

class RemoteArticlesCubit extends Cubit< RemoteArticlesState> {
  final GetArticlesUseCase _getArticlesUseCase;
  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 10;
  RemoteArticlesCubit(this._getArticlesUseCase) : super( RemoteArticlesLoading());

  getArticles() async {
    // emit( RemoteArticlesLoading());
    final dataState = await _getArticlesUseCase(params: ArticlesRequestParams(page: _page));
    print("load data:" +dataState.data.toString());
    if (dataState is DataSuccess && dataState.data!=null) {
      final articles = dataState.data;
      final noMoreData = (articles?.length?? 0)< _pageSize;
      _articles.addAll(articles!);
      _page++;
      print("page:$_page");
      print("_articles size:${_articles.length}");
      await Future<void>.delayed(const Duration(milliseconds: 50));

      emit( RemoteArticlesDone(_articles, noMoreData: noMoreData));
    }
    if (dataState is DataFailed) {
      emit( RemoteArticlesError(dataState.error!));
    }
  }

}

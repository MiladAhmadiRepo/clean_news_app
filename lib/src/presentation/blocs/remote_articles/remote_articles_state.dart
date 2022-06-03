part of 'remote_articles_cubit.dart';

abstract class RemoteArticlesState {
  const RemoteArticlesState();
}

class RemoteArticlesLoading extends RemoteArticlesState {
}

class RemoteArticlesDone extends RemoteArticlesState {
  List<Article> articles=[];
  bool noMoreData=false;
   RemoteArticlesDone(this.articles, {required this.noMoreData});
}

class RemoteArticlesError extends RemoteArticlesState {
   DioError? error;
   RemoteArticlesError(  this. error);
}

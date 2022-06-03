part of 'remote_articles_cubit.dart';

abstract class RemoteArticlesState /*extends Equatable*/ {
  // final List<Article> articles;
  // final bool noMoreData;
  //
  // final DioError? error;

  // RemoteArticlesState({required this.articles,required  this.noMoreData,   this.error});
  const RemoteArticlesState();

  // @override
  // List<Object> get props => [articles, noMoreData, error??''];
}

class RemoteArticlesLoading extends RemoteArticlesState {

   // @override
   // List<Object> get props => [];
}

class RemoteArticlesDone extends RemoteArticlesState {
  List<Article> articles=[];
  bool noMoreData=false;
   RemoteArticlesDone(this.articles, {required this.noMoreData}); //: super(articles: article, noMoreData: noMoreData);

  // @override
  // List<Object> get props => [articles,noMoreData];
}

class RemoteArticlesError extends RemoteArticlesState {
   DioError? error;
   RemoteArticlesError(  this. error);//: super(error: error,noMoreData: false,articles: List<Article>.empty());
   // @override
   // List<Object> get props => [error!];
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/constants.dart';
import 'data/datasources/remote/news_api_service.dart';
import 'data/repositories/articles_repository_impl.dart';
import 'domain/repositories/articles_repository.dart';
import 'domain/usecaes/get_articles_usecase.dart';
import 'presentation/blocs/remote_articles/remote_articles_cubit.dart';

final injector = GetIt.instance;
Future<void> initializeDependencies() async {

  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));
  injector.registerSingleton<ArticlesRepository>(
    ArticlesRepositoryImpl(injector()),
  );

  // UseCases
  injector.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));

  // Blocs
  injector.registerFactory<RemoteArticlesCubit>(
    () => RemoteArticlesCubit(injector()),
  );


}

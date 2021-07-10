import 'package:bljr_mvvm/core/services/api.dart';
import 'package:bljr_mvvm/core/viewmodel/news_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => ApiServices());
  locator.registerFactory(() => NewsViewModel());
}
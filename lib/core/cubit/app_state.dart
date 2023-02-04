part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppLoadingArticlesState extends AppState {}

class AppChangeBottomNavBar extends AppState {}

class AppGetBusinessArticlesSucess extends AppState {}

class AppGetBusinessArticlesError extends AppState {
  final String error;

  AppGetBusinessArticlesError(this.error);
}

class AppGetSportsArticlesSucess extends AppState {}

class AppGetSportsArticlesError extends AppState {
  final String error;

  AppGetSportsArticlesError(this.error);
}

class AppGetScienceArticlesSucess extends AppState {}

class AppGetScienceArticlesError extends AppState {
  final String error;

  AppGetScienceArticlesError(this.error);
}

class AppChangeThemeState extends AppState {}

class AppSearchIntial extends AppState {}

class AppGetArticlesSearchStateSucess extends AppState {}

class AppGetArticlesSearchStateError extends AppState {
  final String error;

  AppGetArticlesSearchStateError(this.error);
}

class AppCachThemeDataState extends AppState {}

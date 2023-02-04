import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/core/constants/dio_url_paths.dart';
import 'package:newsapp/core/shared/network/local/shared_prefrances.dart';
import 'package:newsapp/core/shared/network/remote/dio_helper.dart';
import 'package:newsapp/features/business/pages/business_screen.dart';
import 'package:newsapp/features/science/pages/science_screen.dart';
import 'package:newsapp/features/sports/pages/sports_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];
  void changeNavBarItem(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBar());
    switch (currentIndex) {
      case 1:
        getSports();
        break;
      case 2:
        getScience();
        break;
      case 0:
        getBusiness();
        break;
    }
  }

  void getBusiness() {
    emit(AppLoadingArticlesState());
    DioHelper().get(url: "v2/top-headlines", query: {
      "country": "eg",
      "apiKey": apiKey,
      "category": "business"
    }).then((value) {
      business = value.data["articles"];
      emit(AppGetBusinessArticlesSucess());
    }).catchError((e) {
      emit(AppGetBusinessArticlesError(e.toString()));
    });
  }

  void getSports() {
    emit(AppLoadingArticlesState());
    DioHelper().get(url: "v2/top-headlines", query: {
      "country": "eg",
      "apiKey": apiKey,
      "category": "sport"
    }).then((value) {
      sports = value.data["articles"];
      emit(AppGetSportsArticlesSucess());
    }).catchError((e) {
      emit(AppGetSportsArticlesError(e.toString()));
    });
  }

  void getScience() {
    emit(AppLoadingArticlesState());
    DioHelper().get(url: "v2/top-headlines", query: {
      "country": "eg",
      "apiKey": apiKey,
      "category": "science"
    }).then((value) {
      science = value.data["articles"];
      emit(AppGetScienceArticlesSucess());
    }).catchError((e) {
      emit(AppGetScienceArticlesError(e.toString()));
    });
  }

  bool isDark = false;
  void changeTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeThemeState());
    }
    isDark = !isDark;
    CachHelper().setData("isDark", isDark);
    emit(AppCachThemeDataState());
    emit(AppChangeThemeState());
  }

  List<dynamic> search = [];
  void seachArticles({String? key}) {
    emit(AppLoadingArticlesState());
    search = [];
    DioHelper().get(url: "v2/everything", query: {
      "q": "$key",
      "apiKey": apiKey,
    }).then((value) {
      search = value.data["articles"];
      // print(value.data["articles"][0]);
      emit(AppGetArticlesSearchStateSucess());
    }).catchError((e) {
      emit(AppGetArticlesSearchStateError(e.toString()));
    });
  }
}

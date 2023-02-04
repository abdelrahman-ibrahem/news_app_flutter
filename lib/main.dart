import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/core/constants/bloc_observer.dart';
import 'package:newsapp/core/cubit/app_cubit.dart';
import 'package:newsapp/core/shared/network/local/shared_prefrances.dart';
import 'package:newsapp/core/shared/network/remote/dio_helper.dart';
import 'package:newsapp/features/home/pages/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CachHelper.init();
  bool? isDark = CachHelper().getData("isDark");
  runApp(AppWidget(
    isDark: isDark,
  ));
}

class AppWidget extends StatelessWidget {
  final bool? isDark;
  const AppWidget({super.key, this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getBusiness()
        ..changeTheme(fromShared: isDark),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backgroundColor: HexColor('333739'),
                elevation: 0.0,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            themeMode: AppCubit().get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            title: "New App",
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

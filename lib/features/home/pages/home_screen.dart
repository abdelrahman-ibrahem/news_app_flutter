import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/cubit/app_cubit.dart';
import 'package:newsapp/features/search/pages/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // lisen states
        // print(state);
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchSCreen(),
                      ));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  // change theme
                  cubit.changeTheme();
                },
                icon: AppCubit().isDark
                    ? Icon(Icons.dark_mode)
                    : Icon(Icons.light_mode_rounded),
              )
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.navBarItems,
            onTap: (index) {
              cubit.changeNavBarItem(index);
            },
          ),
        );
      },
    );
  }
}

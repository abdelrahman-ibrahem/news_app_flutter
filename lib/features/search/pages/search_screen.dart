import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/cubit/app_cubit.dart';
import 'package:newsapp/core/shared/componants/single_article_widget.dart';

class SearchSCreen extends StatelessWidget {
  const SearchSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit();
        final search = cubit.search;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Search Screen"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onChanged: (value) {
                    AppCubit().seachArticles(key: value);
                  },
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: search.length,
                    itemBuilder: (context, index) {
                      return SingleArticleWidget(
                          article: search[index], context: context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

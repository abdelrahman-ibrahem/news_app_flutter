import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/cubit/app_cubit.dart';
import 'package:newsapp/core/shared/componants/single_article_widget.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppLoadingArticlesState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AppGetSportsArticlesSucess) {
          AppCubit cubit = AppCubit().get(context);
          final sports = cubit.sports;
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return SingleArticleWidget(
                  article: sports[index], context: context);
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: sports.length,
          );
        }
        return SizedBox();
      },
    );
  }
}

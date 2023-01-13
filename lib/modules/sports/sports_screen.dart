import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

import '../../widgets/article_item.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List sportsArticles = NewsCubit.get(context).sports;
        return (sportsArticles.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BuildArticleItem(article: sportsArticles[index]);
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      width: double.infinity,
                      height: 0.5,
                      color: Colors.grey[300],
                    ),
                  );
                },
                itemCount: sportsArticles.length);
      },
    );
  }
}

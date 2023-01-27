import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/article_item.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List businessArticles = NewsCubit.get(context).business;
        return (businessArticles.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : ScreenTypeLayout(
                mobile: Builder(builder: ((context) {
                  NewsCubit.get(context).setDesktop(false);
                  return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BuildArticleItem(
                            article: businessArticles[index]);
                      },
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: double.infinity,
                            height: 0.5,
                            color: Colors.grey[300],
                          ),
                        );
                      },
                      itemCount: businessArticles.length);
                })),
                desktop: Builder(
                  builder: (context) {
                    NewsCubit.get(context).setDesktop(true);
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return BuildArticleItem(
                                    article: businessArticles[index],
                                    index: index);
                              },
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.5,
                                    color: Colors.grey[300],
                                  ),
                                );
                              },
                              itemCount: businessArticles.length),
                        ),
                        Expanded(
                            child: Container(
                          height: double.infinity,
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Text(
                              "${businessArticles[NewsCubit.get(context).selectedBusinessItem]['description']}",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ))
                      ],
                    );
                  },
                ),
                breakpoints: const ScreenBreakpoints(
                    desktop: 600, tablet: 600, watch: 100),
              );
      },
    );
  }
}

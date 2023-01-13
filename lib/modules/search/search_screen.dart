import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

import '../../widgets/article_item.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchArticles = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(title: const Text("Search")),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Search must not be empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BuildArticleItem(article: searchArticles[index]);
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
                      itemCount: searchArticles.length))
            ],
          ),
        );
      },
    );
  }
}

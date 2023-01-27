import 'package:flutter/material.dart';
import 'package:news_app/layout/cubit/cubit.dart';

class BuildArticleItem extends StatelessWidget {
  final Map article;
  final int? index;
  const BuildArticleItem({super.key, required this.article, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (NewsCubit.get(context).selectedBusinessItem == index) &&
              (NewsCubit.get(context).isDesktop == true)
          ? Colors.grey[200]
          : null,
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => WebViewScreen(
          //         url: article['url'],
          //       ),
          //     ));
          NewsCubit.get(context).selectBusinessItem(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage((article['urlToImage'] == null)
                            ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuroARjim03yfQlxbHViqxY68EWlo8ImUIhw&usqp=CAU'
                            : '${article['urlToImage']}'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          '${article['title']}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Text(
                        '${article['publishedAt']}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

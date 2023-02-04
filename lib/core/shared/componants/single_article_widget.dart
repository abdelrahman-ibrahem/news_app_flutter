import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget SingleArticleWidget(
        {required Map<String, dynamic> article, required context}) =>
    InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(article["urlToImage"].toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 150,
                padding: const EdgeInsets.all(10),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          article["title"].toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        article["publishedAt"].toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

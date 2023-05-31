import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news/data/service/get_news_service.dart';
import 'package:news/view/add_news_page.dart';
import 'package:news/view/info_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddNewsPage(),
                      ));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
            future: GetNewsService.getNews(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoPage(data: snapshot.data["data"][index],),
                            ));
                      },
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data["data"][index]["img"])),
                      title: Text(snapshot.data["data"][index]["title"]),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(snapshot.data["data"][index]["subtitle"]),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                const Icon(Icons.remove_red_eye_outlined),
                                Text(snapshot.data["data"][index]["details"]
                                        ["views"]
                                    .toString())
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.favorite_border_outlined),
                              Text(snapshot.data["data"][index]["details"]
                                      ["likes"]
                                  .toString())
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: (snapshot.data["data"] as List).length,
                );
              }
            }));
  }
}

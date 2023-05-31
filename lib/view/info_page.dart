import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news/provider/info_provider.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const InfoPage({super.key, required this.data});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  bool isLiked = true;
  void initState() {
    context.read<InfoProvider>().incrementCount(id: widget.data["_id"]);
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InfoProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Info Page"),
            leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/", (route) => false);
                        setState(() {
                          
                        });
                  },
                  icon: const Icon(Icons.arrow_back_ios_outlined)),
          ),
          body: Column(
            children: [
              Expanded(
                  child: Image.network(
                widget.data["img"],
                fit: BoxFit.cover,
              )),
              Expanded(
                  child: Column(
                children: [
                  ListTile(
                    title: Text(widget.data["title"]),
                    subtitle: Text(widget.data["subtitle"]),
                    trailing: IconButton(
                        onPressed: () {
                          context.read<InfoProvider>().isLiked();
                          context
                              .read<InfoProvider>()
                              .likeCount(id: widget.data["_id"]);
                        },
                        icon: context
                              .watch<InfoProvider>().isLike
                            ? const Icon(Icons.favorite_border_rounded)
                            : const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                  )
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}

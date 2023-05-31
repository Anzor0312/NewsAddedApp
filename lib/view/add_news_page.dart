import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news/provider/add_news_provider.dart';
import 'package:provider/provider.dart';

class AddNewsPage extends StatefulWidget {
  const AddNewsPage({super.key});

  @override
  State<AddNewsPage> createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddNewsProvider(),
      builder: (context, child) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Add News"),
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
                const Text("Yangi ma'lumotlarni shu yerdan kiritasiz."),
                TextFormField(
                  controller: context.watch<AddNewsProvider>().titleController,
                  decoration: const InputDecoration(
                      hintText: "Yangilik sarlavhasini kiriting"),
                ),
                TextFormField(
                  controller:
                      context.watch<AddNewsProvider>().subtitleController,
                  decoration: const InputDecoration(
                      hintText: "Yangilik haqida batafsil ma'lumot"),
                ),
                TextFormField(
                  controller: context.watch<AddNewsProvider>().imgController,
                  decoration: const InputDecoration(
                      hintText: "Yangilik haqida rasm yuklash"),
                ),
              ],
            ),
            floatingActionButton: ElevatedButton(
              onPressed: () {
                context.read<AddNewsProvider>().postNews();
              },
              child: const Text("Yangilikni yuklash"),
            ));
      },
    );
  }
}

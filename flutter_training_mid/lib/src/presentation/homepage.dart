import 'package:flutter/material.dart';
import 'package:flutter_training_mid/src/business/dog_provider.dart';
import 'package:flutter_training_mid/src/data/model/dog/dog.dart';
import 'package:flutter_training_mid/src/injector.dart';
import 'package:flutter_training_mid/src/presentation/detail_screen.dart';
import 'package:flutter_training_mid/src/widget/search_action.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DogProvider dogProvider;

  @override
  void initState() {
    dogProvider = injector<DogProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchAction());
            },
          )
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder<Status>(
            valueListenable: dogProvider.status,
            builder: (context, status, child) {
              if (status == Status.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (status == Status.error) {
                return const Center(
                  child: Icon(Icons.error),
                );
              } else {
                return ValueListenableBuilder(
                  valueListenable: dogProvider.listDog,
                  builder: (context, List<Dog> listDog, child) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: listDog.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                dog: listDog[index],
                              ),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ],
                            ),
                            child: Row(children: [
                              Expanded(
                                child: Hero(
                                  tag: listDog[index].name!,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(listDog[index].url!),
                                    radius: 24,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listDog[index].name!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}

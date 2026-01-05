import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List animeList = [];

  @override
  void initState() {
    super.initState();
    loadAnime();
  }

  Future<void> loadAnime() async {
    final String response =
        await rootBundle.loadString('lib/data/anime_data.json');
    final data = json.decode(response);
    setState(() {
      animeList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime App'),
        centerTitle: true,
      ),
      body: animeList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: animeList.length,
              itemBuilder: (context, index) {
                final anime = animeList[index];
                return Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        anime['cover'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      anime['title'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              },
            ),
    );
  }
}

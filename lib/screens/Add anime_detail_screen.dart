import 'package:flutter/material.dart';

class AnimeDetailScreen extends StatelessWidget {
  final Map anime;

  const AnimeDetailScreen({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anime['title']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image
            Image.network(
              anime['cover'],
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    anime['title'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text(
                        anime['rating'].toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  // Info
                  Text(
                    "Studio: ${anime['studio']}",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Year: ${anime['year']}",
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "Status: ${anime['status']}",
                    style: TextStyle(fontSize: 14),
                  ),

                  SizedBox(height: 15),

                  // Genres
                  Wrap(
                    spacing: 8,
                    children: List.generate(
                      anime['genres'].length,
                      (index) => Chip(
                        label: Text(anime['genres'][index]),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Synopsis
                  Text(
                    "Synopsis",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    anime['synopsis'],
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

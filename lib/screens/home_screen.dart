import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List animeList = [];

  Future<void> loadAnime() async {
    final data = await rootBundle.loadString('lib/data/anime_data.json');
    setState(() {
      animeList = json.decode(data)['anime'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime App"),
        centerTitle: true,
      ),
      body: animeList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: animeList.length,
              itemBuilder: (

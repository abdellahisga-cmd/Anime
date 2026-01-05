body: animeList.isEmpty
    ? const Center(child: CircularProgressIndicator())
    : GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          final anime = animeList[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AnimeDetailScreen(anime: anime),
                ),
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    anime['cover'],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  anime['title'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),

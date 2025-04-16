import 'package:flutter/material.dart';
import '../models/music.dart';
import '../widgets/musiccard.dart';
import 'playerscreen.dart';
import 'addmusicscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState(); // <- aqui trocou
}

class HomeScreenState extends State<HomeScreen> {
  List<Music> musics = [
    Music(title: "Música 1", artist: "Artista A", url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"),
    Music(title: "Música 2", artist: "Artista B", url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3"),
  ];

  bool showFavoritesOnly = false;

  void toggleFavorite(Music music) {
    setState(() {
      music.isFavorite = !music.isFavorite;
    });
  }

  void addMusic(Music music) {
    setState(() {
      musics.add(music);
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayedMusics = showFavoritesOnly
        ? musics.where((m) => m.isFavorite).toList()
        : musics;

    return Scaffold(
      appBar: AppBar(title: Text("Minhas Músicas")),
      body: Column(
        children: [
          SwitchListTile(
            title: Text("Mostrar apenas favoritos"),
            value: showFavoritesOnly,
            onChanged: (val) {
              setState(() {
                showFavoritesOnly = val;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedMusics.length,
              itemBuilder: (context, index) {
                final music = displayedMusics[index];
                return MusicCard(
                  music: music,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlayerScreen(music: music),
                    ),
                  ),
                  onFavoriteToggle: () => toggleFavorite(music),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddMusicScreen(onAdd: addMusic),
          ),
        ),
      ),
    );
  }
}

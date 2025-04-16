import 'package:flutter/material.dart';
import '../models/music.dart';

class MusicCard extends StatelessWidget {
  final Music music;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const MusicCard({super.key, 
    required this.music,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(music.title),
        subtitle: Text(music.artist),
        leading: Icon(Icons.music_note),
        trailing: IconButton(
          icon: Icon(
            music.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: music.isFavorite ? Colors.red : null,
          ),
          onPressed: onFavoriteToggle,
        ),
        onTap: onTap,
      ),
    );
  }
}

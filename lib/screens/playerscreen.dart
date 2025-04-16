import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/music.dart';

class PlayerScreen extends StatefulWidget {
  final Music music;

  const PlayerScreen({super.key, required this.music});

  @override
  PlayerScreenState createState() => PlayerScreenState(); // <- aqui trocou
}

class PlayerScreenState extends State<PlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(widget.music.url));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.music.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, size: 100),
            SizedBox(height: 20),
            Text(widget.music.artist, style: TextStyle(fontSize: 24)),
            SizedBox(height: 40),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, size: 50),
              onPressed: togglePlayPause,
            ),
          ],
        ),
      ),
    );
  }
}

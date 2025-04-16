import 'package:flutter/material.dart';
import '../models/music.dart';

class AddMusicScreen extends StatefulWidget {
  final Function(Music) onAdd;

  const AddMusicScreen({super.key, required this.onAdd});

  @override
  AddMusicScreenState createState() => AddMusicScreenState(); // <- aqui trocou
}

class AddMusicScreenState extends State<AddMusicScreen> {
  final _titleController = TextEditingController();
  final _artistController = TextEditingController();
  final _urlController = TextEditingController();

  void _submit() {
    if (_titleController.text.isEmpty || _artistController.text.isEmpty || _urlController.text.isEmpty) return;

    final newMusic = Music(
      title: _titleController.text,
      artist: _artistController.text,
      url: _urlController.text,
    );

    widget.onAdd(newMusic);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar Música")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'Título')),
            TextField(controller: _artistController, decoration: InputDecoration(labelText: 'Artista')),
            TextField(controller: _urlController, decoration: InputDecoration(labelText: 'URL da música')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _submit, child: Text("Adicionar")),
          ],
        ),
      ),
    );
  }
}

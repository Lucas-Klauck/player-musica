class Music {
  final String title;
  final String artist;
  final String url;
  bool isFavorite;

  Music({
    required this.title,
    required this.artist,
    required this.url,
    this.isFavorite = false,
  });
}

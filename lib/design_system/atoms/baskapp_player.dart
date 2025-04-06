class BaskappPlayer {
  String name;
  int number;
  String? pictureUrl;
  int? points;

  BaskappPlayer({
    required this.name,
    required this.number,
    this.pictureUrl,
    this.points,
  });
}
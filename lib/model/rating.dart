class Rating {
  int id;
  String name;
  String message;
  int starCount;
  String date;
  bool liked;
  List<String>? images;
  Rating({
    required this.id,
    required this.message,
    required this.starCount,
    required this.name,
    required this.date,
    required this.liked,
    this.images,
  });
}

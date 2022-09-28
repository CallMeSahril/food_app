class Food {
  final String id, title, category, imageUrl;
  final List<String> ingredients;
  final int duration;
  bool isFavorite;

  Food(
      {required this.id,
      required this.title,
      required this.category,
      required this.imageUrl,
      required this.ingredients,
      required this.duration,
      this.isFavorite = false, });
}

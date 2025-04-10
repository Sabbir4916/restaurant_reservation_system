class Restaurant {
  final String name;
  final String imageUrl;
  final double rating;
  final String location;
  final String description;

  const Restaurant({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.location,
    required this.description,
  });

  @override
  bool operator == (Object other) =>
      identical(this, other);

}
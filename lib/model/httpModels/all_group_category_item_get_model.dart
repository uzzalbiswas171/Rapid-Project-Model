





class Category {
  final String id;
  final String name;
  final String arabicName;

  Category({
    required this.id,
    required this.name,
    required this.arabicName,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'].toString(),
      name: json['name'].toString()??'',
      arabicName: json['arabic_name'].toString()??'',
    );
  }
}



class Group {
  final String id;
  final String name;
  final String arabicName;
  final String imageUrl;
  final List<Category> categories;

  Group({
    required this.id,
    required this.name,
    required this.arabicName,
    required this.imageUrl,
    required this.categories,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    var categoryList = (json['categories'] as List)
        .map((cat) => Category.fromJson(cat))
        .toList();

    return Group(
      id: json['id'].toString(),
      name: json['name'].toString()??'',
      arabicName: json['arabic_name'].toString()??'',
      imageUrl: json['image_url'].toString()??'',
      categories: categoryList,
    );
  }
}

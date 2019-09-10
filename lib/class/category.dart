class Category {
  int id;
  String name;
  int domainId;
  Category({this.id, this.name, this.domainId});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      domainId: json['domainId'],
    );
  }
}

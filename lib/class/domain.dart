import "./category.dart";
class Domain {
  int id;
  String domainName;
  List<Category> categories;

  Domain({this.id, this.domainName, this.categories});
  
  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain(
      id: json['id'],
      domainName: json['domainName'],
      categories:List<Category>.from(json['categories'].map((category)=>Category.fromJson(category))),
    );
  }
 
}